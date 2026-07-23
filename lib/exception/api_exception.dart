import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;
  final DioExceptionType? type;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
    this.type,
  });

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}
