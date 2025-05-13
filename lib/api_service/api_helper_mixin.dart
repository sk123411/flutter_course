import 'package:flutter/material.dart';

import 'api_service.dart';

mixin ApiHelperMixin {
  late ApiService _apiService;

  void initApiHelper(BuildContext context) {
    _apiService = ApiService.withContext(context);
  }

  Future<dynamic> get(String endpoint) async {
    return await _apiService.getRequest(endpoint);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    return await _apiService.postRequest(endpoint, data);
  }

}
