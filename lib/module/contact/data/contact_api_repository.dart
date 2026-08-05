import 'package:connect/module/contact/data/contact_lookup.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// Backend contact lookup: which of the given phones already have a Mitra account.
class ContactApiRepository {
  final ApiController _api = ApiController.instance;

  /// Batches up to 500 phones (E.164). Returns one status per unique phone.
  Future<List<PhoneStatus>> lookup(List<String> phones) async {
    if (phones.isEmpty) return const [];
    final res = await _api.post(EndPoints.CONTACTS_LOOKUP, body: {'phones': phones});
    final results = (res.data as Map<String, dynamic>)['results'] as List<dynamic>? ?? const [];
    return results
        .map((e) => PhoneStatus.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }
}
