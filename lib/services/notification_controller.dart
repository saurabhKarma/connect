import 'dart:io';

import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/services/push_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the single PushService instance (created + initialized in main).
final pushServiceProvider =
    Provider<PushService>((ref) => throw UnimplementedError('override in main()'));

final notificationControllerProvider =
    NotifierProvider<NotificationController, void>(NotificationController.new);

/// Coordinates notification permission + registering this device with the backend.
class NotificationController extends Notifier<void> {
  @override
  void build() {}

  /// Called once the user is signed in: ask permission, get the FCM token,
  /// register it, and keep it fresh on refresh.
  Future<void> syncDevice() async {
    final push = ref.read(pushServiceProvider);
    final granted = await push.requestPermission();
    if (!granted) return;

    final token = await push.getToken();
    if (token != null && token.isNotEmpty) {
      await _register(token);
    }
    push.onTokenRefresh.listen(_register);
  }

  Future<bool> requestPermission() => ref.read(pushServiceProvider).requestPermission();

  Future<void> _register(String token) async {
    try {
      await ref.read(authRepositoryProvider).registerDevice(
            fcmToken: token,
            platform: Platform.isAndroid ? 'android' : 'ios',
            appVersion: '1.0.0',
          );
    } catch (_) {
      // best-effort; will retry on next login / token refresh
    }
  }
}
