import 'package:connect/module/broadcastlist/data/broadcast_list_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// WhatsApp-style broadcast lists API.
class BroadcastListRepository {
  final ApiController _api = ApiController.instance;

  Future<BroadcastListSummary> create({required String name, required List<String> phones}) async {
    final res = await _api.post(EndPoints.BROADCAST_LISTS, body: {'name': name, 'phones': phones});
    return BroadcastListSummary.fromJson(res.data as Map<String, dynamic>);
  }

  Future<List<BroadcastListSummary>> myLists() async {
    final res = await _api.get(EndPoints.BROADCAST_LISTS);
    return (res.data as List<dynamic>)
        .map((e) => BroadcastListSummary.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BroadcastListDetail> detail(String id) async {
    final res = await _api.get(EndPoints.broadcastList(id));
    return BroadcastListDetail.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> delete(String id) async {
    await _api.delete(EndPoints.broadcastList(id));
  }

  /// Rename a list.
  Future<BroadcastListSummary> rename(String id, String name) async {
    final res = await _api.patch(EndPoints.broadcastList(id), body: {'name': name});
    return BroadcastListSummary.fromJson(res.data as Map<String, dynamic>);
  }

  /// Add contacts (by E.164 phone) to a list; returns the updated member list.
  Future<BroadcastListDetail> addMembers(String id, List<String> phones) async {
    final res = await _api.post(EndPoints.broadcastListMembers(id), body: {'phones': phones});
    return BroadcastListDetail.fromJson(res.data as Map<String, dynamic>);
  }

  /// Remove a member (by phone) from a list; returns the updated member list.
  Future<BroadcastListDetail> removeMember(String id, String phone) async {
    final res = await _api.delete(EndPoints.broadcastListMembers(id), body: {'phone': phone});
    return BroadcastListDetail.fromJson(res.data as Map<String, dynamic>);
  }

  /// History of broadcasts sent to this list (newest first).
  Future<List<ListMessage>> messages(String id) async {
    final res = await _api.get(EndPoints.broadcastListMessages(id));
    return (res.data as List<dynamic>)
        .map((e) => ListMessage.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Broadcast a message to the whole list.
  Future<ListMessage> send(String id, {String? message, String? mediaUrl, String? mediaType}) async {
    final res = await _api.post(EndPoints.broadcastListMessages(id), body: {
      if (message != null && message.isNotEmpty) 'message': message,
      if (mediaUrl != null && mediaUrl.isNotEmpty) 'mediaUrl': mediaUrl,
      if (mediaType != null && mediaType.isNotEmpty) 'mediaType': mediaType,
    });
    return ListMessage.fromJson(res.data as Map<String, dynamic>);
  }
}
