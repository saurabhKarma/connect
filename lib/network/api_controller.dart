import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:connect/exception/api_exception.dart';
import 'package:connect/network/dio_http_client.dart';
import 'package:connect/utility/NativeFileOpener.dart';
import 'package:connect/utility/simple_log.dart';
import 'package:connect/utility/utility.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:share_plus/share_plus.dart';

class ApiController {
  static final ApiController _instance = ApiController._internal();
  late final Dio _dio;

  // Private constructor
  ApiController._internal() {
    _dio = DioSingleton().dio;
  }

  factory ApiController() => _instance;

  static ApiController get instance => _instance;

  /// Handle Dio exceptions and convert to ApiException
  ApiException _handleDioException(DioException error) {
    String message;
    int? statusCode = error.response?.statusCode;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Request send timeout. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Response receive timeout. Please try again.';
        break;
      case DioExceptionType.badResponse:
        message = _getErrorMessageFromResponse(error.response);
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled.';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection error. Please check your internet connection.';
        break;
      case DioExceptionType.badCertificate:
        message = 'Certificate verification failed.';
        break;
      // case DioExceptionType.unknown:
      default:
        message = 'An unexpected error occurred: ${error.message}';
        break;
    }

    return ApiException(message: message, statusCode: statusCode, data: error.response?.data, type: error.type);
  }

  /// Extract error message from response
  String _getErrorMessageFromResponse(Response? response) {
    if (response == null) return 'Unknown error occurred.';

    final statusCode = response.statusCode;
    final data = response.data;

    // Try to extract error message from common response formats
    if (data is Map) {
      if (data.containsKey('message')) return data['message'].toString();
      if (data.containsKey('error')) return data['error'].toString();
      if (data.containsKey('msg')) return data['msg'].toString();
    }

    // Return generic message based on status code
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access forbidden.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Request failed with status code: $statusCode';
    }
  }

  /// POST request with comprehensive error handling
  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      Map<String, dynamic> headersMap = {};
      if (headers != null) headersMap.addAll(headers);

      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headersMap,
          contentType: headersMap.containsKey('Content-Type') ? null : Headers.jsonContentType,
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      );

      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in POST: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  /// GET request with comprehensive error handling
  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      Map<String, dynamic> headersMap = {};
      if (headers != null) headersMap.addAll(headers);

      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headersMap,
          contentType: headersMap.containsKey('Content-Type') ? null : Headers.jsonContentType,
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      );

      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in GET: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  /// PUT request with comprehensive error handling
  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      Map<String, dynamic> headersMap = {};
      if (headers != null) headersMap.addAll(headers);

      final response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: headersMap.containsKey('Content-Type') ? null : Headers.jsonContentType,
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      );

      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in PUT: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  /// DELETE request with comprehensive error handling
  Future<Response> delete(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      );

      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in DELETE: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  /// PATCH request with comprehensive error handling
  Future<Response> patch(
    String url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
          sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        ),
      );

      return response;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in PATCH: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  Future<String?> downloadFile(
    String url, {
    required String fileName,
    required String extension,
    bool openFile = false,
    bool shareFile = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      final tempDirectory = await path.getTemporaryDirectory();
      final tempPath = join(tempDirectory.path, '$fileName.$extension');

      // Delete old temp file if exists
      final file = File(tempPath);
      if (await file.exists()) {
        await file.delete();
      }

      final downloadTargetPath = await prepareDownloadTarget('$fileName.$extension');

      // Perform download using Dio
      final response = await _dio.download(
        url,
        tempPath,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
          receiveTimeout: receiveTimeout ?? const Duration(milliseconds: 300000),
          sendTimeout: sendTimeout ?? const Duration(milliseconds: 300000),
        ),
      );

      // Check response success
      if (response.statusCode == 200) {
        // await file.writeAsBytes(response.data!, flush: true);
        bool copied = false;
        String? savePath;
        if (shareFile) {
          savePath = tempPath;
        } else {
          copied = await copyFileIntoDownloadFolder(file.path, '$fileName.$extension') ?? false;
          if (copied) {
            final downloadDir = await getDownloadDirectory();
            savePath = join(downloadDir.path, '$fileName.$extension');
          }
        }

        if (openFile && copied) {
          if (Platform.isAndroid && savePath != null) {
            NativeFileOpener.openFile(tempPath, mimeType: Utility.fileExtension(file.path));
          }
        } else if (shareFile) {
          await SharePlus.instance.share(ShareParams(files: [XFile(savePath!)]));
        }

        return savePath;
      } else {
        throw ApiException(message: 'File download failed with status ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in DOWNLOAD: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  Future<String?> downloadFileAsPost(
    String url, {
    required String fileName,
    required String extension,
    Map<String, dynamic>? data,
    bool openFile = false,
    Map<String, dynamic>? headers,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    try {
      final tempDirectory = await path.getTemporaryDirectory();
      final tempPath = join(tempDirectory.path, '$fileName.$extension');

      // Delete old temp file if exists
      final file = File(tempPath);
      if (await file.exists()) {
        await file.delete();
      }

      // Ensure fresh file in download folder
      final downloadTargetPath = await prepareDownloadTarget('$fileName.$extension');

      // Perform POST request
      final response = await _dio.post<List<int>>(
        url,
        data: data,
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
          receiveTimeout: receiveTimeout ?? const Duration(milliseconds: 300000),
          sendTimeout: sendTimeout ?? const Duration(milliseconds: 300000),
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        // Save bytes to file
        await file.writeAsBytes(response.data!, flush: true);

        final result = await copyFileIntoDownloadFolder(file.path, '$fileName.$extension') ?? false;
        String? savePath;

        if (openFile && result) {
          final downloadDir = await getDownloadDirectory();
          savePath = join(downloadDir.path, '$fileName.$extension');

          if (Platform.isAndroid) {
            NativeFileOpener.openFile(tempPath, mimeType: Utility.fileExtension(file.path));
          } else {
            openDownloadFolder();
          }
        }

        return savePath;
      } else {
        throw ApiException(message: 'File download failed with status ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      SimpleLogger.debug(ApiController, 'Unexpected error in POST DOWNLOAD: $e');
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  Future<String> prepareDownloadTarget(String fileNameWithExt) async {
    final downloadDir = await getDownloadDirectory();
    final targetPath = join(downloadDir.path, fileNameWithExt);
    final existing = File(targetPath);

    if (await existing.exists()) {
      try {
        await existing.delete();
      } catch (xe) {
        print('Error deleting file $xe');
      }
    }
    return targetPath;
  }
}