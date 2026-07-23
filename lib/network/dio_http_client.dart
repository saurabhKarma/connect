import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:connect/network/interceptor/auth_interceptor.dart';
import 'package:connect/network/interceptor/token_refresh_interceptor.dart';
import 'package:connect/network/interceptor/trace_interceptor.dart';

import 'package:connect/network/end_points.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();
  late Dio _dio;

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal() {
    _dio = Dio();
    _dio.options.baseUrl = EndPoints.BASE_URL;
    // Fail fast on unreachable servers / flaky networks instead of hanging for minutes.
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(TraceInterceptor(enableLogging: true, traceIdHeader: 'X-Trace-Id'));
    _dio.interceptors.add(TokenRefreshInterceptor());
  }

  Dio get dio {
    return _dio;
  }
}
