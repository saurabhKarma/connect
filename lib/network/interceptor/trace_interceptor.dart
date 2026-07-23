import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

/// Interceptor for tracing HTTP requests and responses with unique trace IDs
class TraceInterceptor extends Interceptor {
  final Uuid _uuid = const Uuid();
  final bool enableLogging;
  final String traceIdHeader;

  /// Creates a trace interceptor
  ///
  /// [enableLogging] - Enable console logging (default: true)
  /// [traceIdHeader] - Header name for trace ID (default: 'X-Trace-Id')
  TraceInterceptor({this.enableLogging = true, this.traceIdHeader = 'X-Trace-Id'});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final traceId = _uuid.v4();
    options.headers[traceIdHeader] = traceId;
    options.headers['Accept'] = 'application/json';

    options.extra['traceId'] = traceId;
    options.extra['requestTime'] = DateTime.now();

    if (enableLogging) {
      _logRequest(options, traceId);
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final traceId = response.requestOptions.extra['traceId'] as String?;
    final requestTime = response.requestOptions.extra['requestTime'] as DateTime?;

    if (enableLogging && traceId != null) {
      final duration = requestTime != null ? DateTime.now().difference(requestTime).inMilliseconds : null;
      _logResponse(response, traceId, duration);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final traceId = err.requestOptions.extra['traceId'] as String?;
    final requestTime = err.requestOptions.extra['requestTime'] as DateTime?;

    if (enableLogging && traceId != null) {
      final duration = requestTime != null ? DateTime.now().difference(requestTime).inMilliseconds : null;
      _logError(err, traceId, duration);
    }

    super.onError(err, handler);
  }

  void _logRequest(RequestOptions options, String traceId) {
    log('┌──────────────────────────────────────────────────────────────');
    log('│ [HTTP REQUEST]');
    log('│ Trace ID: $traceId');
    log('│ Method: ${options.method}');
    log('│ URL: ${options.uri}');

    if (options.headers.isNotEmpty) {
      log('│ Headers:');
      options.headers.forEach((key, value) {
        log('│   $key: $value');
      });
    }

    if (options.queryParameters.isNotEmpty) {
      log('│ Query Parameters:');
      options.queryParameters.forEach((key, value) {
        log('│   $key: $value');
      });
    }

    if (options.data != null) {
      log('│ Body: ${options.data}');
    }

    log('└──────────────────────────────────────────────────────────────');
  }

  void _logResponse(Response response, String traceId, int? duration) {
    log('┌──────────────────────────────────────────────────────────────');
    log('│ [HTTP RESPONSE]');
    log('│ Trace ID: $traceId');
    log('│ Status Code: ${response.statusCode}');
    log('│ URL: ${response.requestOptions.uri}');

    if (duration != null) {
      log('│ Duration: ${duration}ms');
    }

    if (response.headers.map.isNotEmpty) {
      log('│ Response Headers:');
      response.headers.map.forEach((key, value) {
        log('│   $key: ${value.join(', ')}');
      });
    }

    log('│ Response Data: ${response.data}');
    log('└──────────────────────────────────────────────────────────────');
  }

  void _logError(DioException err, String traceId, int? duration) {
    log('┌──────────────────────────────────────────────────────────────');
    log('│ [HTTP ERROR]');
    log('│ Trace ID: $traceId');
    log('│ Error Type: ${err.type}');
    log('│ Error Message: ${err.message}');
    log('│ URL: ${err.requestOptions.uri}');

    if (duration != null) {
      log('│ Duration: ${duration}ms');
    }

    if (err.response != null) {
      log('│ Status Code: ${err.response?.statusCode}');
      log('│ Response Data: ${err.response?.data}');
    }

    log('└──────────────────────────────────────────────────────────────');
  }
}
