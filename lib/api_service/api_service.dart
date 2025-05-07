

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {

  static final ApiService _instance = ApiService._internal();

  factory ApiService.withContext(BuildContext context) {
    _instance._context = context;
    return _instance;
  }

  late Dio _dio;
  BuildContext? _context;


  ApiService._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://localhost:3000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _dio = Dio(options);


    // Add interceptor for logging/debugging
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('➡️ REQUEST: ${options.method} ${options.uri}');
        debugPrint('Headers: ${options.headers}');
        debugPrint('Body: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('✅ RESPONSE [${response.statusCode}]: ${response.requestOptions.uri}');
        debugPrint('Data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        debugPrint('❌ ERROR: ${error.message}');
        if (error.response != null) {
          debugPrint('Error Data: ${error.response?.data}');
        }
        return handler.next(error);
      },
    ));

  }

  // POST Request
  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse(response);
    } catch (error) {

      _handleError(error);
    }
  }

  // GET Request
  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);

      return _handleResponse(response);
    } catch (error) {
      _handleError(error);
    }
  }

  dynamic _handleResponse(Response response) {
    ScaffoldMessenger.of(_context!).showSnackBar(
      SnackBar(content: Text(response.data["message"]), backgroundColor: Colors.green),
    );
    return response.data;
  }

  void _handleError(dynamic error) {

    String errorMessage =   'Something went wrong';

    if (error is DioException) {

      switch (error.type) {


        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout';
          break;
        case DioExceptionType.badResponse:

          errorMessage = _parseErrorResponse(error.response);
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled';
          break;
        case DioExceptionType.unknown:
          errorMessage = 'No internet or unknown error';
          break;
        default:
          errorMessage = 'Unexpected error occurred';
      }
    }

    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(content: Text(errorMessage),backgroundColor: Colors.red),
      );
    } else {
      debugPrint('⚠️ No context to show Snackbar.');
    }
     throw Exception(errorMessage);
  }

  String _parseErrorResponse(Response? response) {
    if (response == null) return 'Unknown error';

    try {
      if (response.data is Map && response.data['message'] != null) {
        return response.data['message'];
      } else if (response.data is String) {
        return response.data;
      }
    } catch (_) {
      return 'Error: ${response.statusCode}';
    }

    return 'Something went wrong (${response.statusCode})';
  }

}