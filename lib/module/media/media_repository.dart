import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';
import 'package:dio/dio.dart';

/// Uploads an image and returns its public URL (to attach to a message or broadcast).
class MediaRepository {
  final ApiController _api = ApiController.instance;

  Future<String> uploadImage(String filePath) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final res = await _api.post(
      EndPoints.MEDIA_UPLOAD,
      body: form,
      headers: {'Content-Type': 'multipart/form-data'},
    );
    return (res.data as Map<String, dynamic>)['url'] as String;
  }
}
