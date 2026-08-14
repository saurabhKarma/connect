import 'package:connect/network/end_points.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  RemoteConfigService._();

  static const String _baseUrlKey = 'base_url';

  static Future<void> init() async {
    if (kDebugMode) return;

    try {
      final rc = FirebaseRemoteConfig.instance;
      await rc.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await rc.setDefaults({_baseUrlKey: EndPoints.BASE_URL});
      await rc.fetchAndActivate();

      final url = rc.getString(_baseUrlKey);
      if (url.trim().isNotEmpty) {
        EndPoints.baseUrl = url;
      }
    } catch (_) {
    }
  }
}
