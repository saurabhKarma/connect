import 'package:connect/module/broadcast/data/broadcast_api_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// User-owned broadcasts: send one message to a set of contacts (by phone).
class BroadcastApiRepository {
  final ApiController _api = ApiController.instance;

  /// Compose + send. Registered phones receive it in their 1:1 thread + push;
  /// non-app phones come back as NO_DEVICE (offer an invite).
  Future<BroadcastItem> compose({
    String? message,
    String? mediaUrl,
    String? mediaType,
    required List<String> recipientPhones,
  }) async {
    final res = await _api.post(EndPoints.BROADCASTS, body: {
      if (message != null && message.isNotEmpty) 'message': message,
      if (mediaUrl != null && mediaUrl.isNotEmpty) 'mediaUrl': mediaUrl,
      if (mediaType != null && mediaType.isNotEmpty) 'mediaType': mediaType,
      'recipientPhones': recipientPhones,
    });
    return BroadcastItem.fromJson(res.data as Map<String, dynamic>);
  }

  Future<BroadcastPage> list({int page = 0, int size = 20}) async {
    final res = await _api.get(EndPoints.BROADCASTS, queryParameters: {'page': page, 'size': size});
    return BroadcastPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<BroadcastDetail> detail(String id) async {
    final res = await _api.get(EndPoints.broadcast(id));
    return BroadcastDetail.fromJson(res.data as Map<String, dynamic>);
  }
}
