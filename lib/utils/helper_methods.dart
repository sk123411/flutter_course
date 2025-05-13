import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperMethods {

/*
  Helper methods are small, reusable utility functions that perform common tasks
  (like formatting text, dates, or colors) and help keep
  your main code clean and readable.
*/

/*

  ✅ Why Use Helper Methods?
  Avoid code repetition
  Improve readability
  Centralize logic
  Easier maintenance

*/


  /// Generate a random number within a range
  static int generateRandom(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  /// Convert hex string like "#FF5733" or "FF5733" to [Color]
  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex'; // add alpha if missing
    return Color(int.parse(hex, radix: 16));
  }

  /// Check if a string is not null or empty (or just whitespace)
  static bool isNotNullOrEmpty(String? str) {
    return str != null && str.trim().isNotEmpty;
  }

  /// Format currency from string like "999" => "Rs 999/-"
  static String formatCurrency(String? amount) {
    if (!isNotNullOrEmpty(amount)) return 'Rs 0/-';
    return 'Rs ${amount!.trim()}/-';
  }

  /// Format DateTime or timestamp to readable date string
  static String formatDate(DateTime date, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(date);
  }

  /// Format from timestamp (int milliseconds) to readable string
  static String formatDateFromTimestamp(int timestamp, {String pattern = 'dd MMM yyyy'}) {
    return DateFormat(pattern).format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  /// Capitalize the first letter of a string
  static String capitalize(String input) {
    if (!isNotNullOrEmpty(input)) return '';
    return input[0].toUpperCase() + input.substring(1);
  }

  /// Return initials from full name: "John Doe" => "JD"
  static String getInitials(String name) {
    if (!isNotNullOrEmpty(name)) return '';
    final parts = name.trim().split(' ');
    return parts.map((e) => e.isNotEmpty ? e[0].toUpperCase() : '').join();
  }

  /// Truncate text with ellipsis if it's too long
  static String truncateText(String text, {int maxLength = 20}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Format number with commas e.g. 1000000 => 1,000,000
  static String formatWithCommas(num number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }




  /// Convert bool to Yes/No
  static String boolToYesNo(bool value) => value ? 'Yes' : 'No';



  static void showSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  /// Remove extra white spaces from a string
  static String cleanWhiteSpace(String input) {
    return input.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Convert a string to title case
  static String toTitleCase(String input) {
    if (!isNotNullOrEmpty(input)) return '';
    return input.split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Convert file size in bytes to readable format (e.g., KB, MB)
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) return "${(bytes / 1024).toStringAsFixed(2)} KB";
    return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
  }

  /// Get time difference from now as a readable string (e.g., "2 hours ago")
  static String timeAgo(DateTime dateTime) {
    final duration = DateTime.now().difference(dateTime);
    if (duration.inDays > 0) return '${duration.inDays} day(s) ago';
    if (duration.inHours > 0) return '${duration.inHours} hour(s) ago';
    if (duration.inMinutes > 0) return '${duration.inMinutes} minute(s) ago';
    return 'Just now';
  }

  /// Validate email format
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  /// Format phone number for display
  static String formatPhone(String phone) {
    if (phone.length == 10) {
      return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}';
    }
    return phone;
  }

  /// Return only digits from a string
  static String extractDigits(String input) {
    return input.replaceAll(RegExp(r'\D'), '');
  }

  /// Parse string to int safely
  static int parseInt(String value, {int fallback = 0}) {
    return int.tryParse(value) ?? fallback;
  }

  /// Parse string to double safely
  static double parseDouble(String value, {double fallback = 0.0}) {
    return double.tryParse(value) ?? fallback;
  }

}


