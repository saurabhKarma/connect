import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:permission_handler/permission_handler.dart';

/// Persisted app settings (toggles on the Settings screen).
class SettingsState {
  final bool contactPermission;
  final bool notificationPermission;
  final bool appLock;
  final bool darkTheme;

  const SettingsState({
    this.contactPermission = true,
    this.notificationPermission = true,
    this.appLock = false,
    this.darkTheme = false,
  });

  SettingsState copyWith({
    bool? contactPermission,
    bool? notificationPermission,
    bool? appLock,
    bool? darkTheme,
  }) {
    return SettingsState(
      contactPermission: contactPermission ?? this.contactPermission,
      notificationPermission: notificationPermission ?? this.notificationPermission,
      appLock: appLock ?? this.appLock,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  factory SettingsState.initial() => const SettingsState();
}

class SettingsPrefs {
  static const _storage = FlutterSecureStorage();

  static const kContact = 'set_contact';
  static const kNotif = 'set_notif';
  static const kLock = 'set_lock';
  static const kDark = 'set_dark';

  static Future<bool> read(String key, bool def) async {
    try {
      final v = await _storage.read(key: key);
      return v == null ? def : v == 'true';
    } catch (_) {
      return def; // corrupted secure store -> default setting
    }
  }

  static Future<void> write(String key, bool value) => _storage.write(key: key, value: '$value');

  static Future<SettingsState> load() async => SettingsState(
        contactPermission: await read(kContact, true),
        notificationPermission: await read(kNotif, true),
        appLock: await read(kLock, false),
        darkTheme: await read(kDark, false),
      );
}

final settingsControllerProvider =
    NotifierProvider<SettingsController, SettingsState>(() => SettingsController(SettingsState.initial()));

class SettingsController extends Notifier<SettingsState> {
  SettingsController(this._initial);

  final SettingsState _initial;

  @override
  SettingsState build() => _initial;

  /// Contact + notification toggles reflect the real OS permission, not a
  /// stored preference. Call after the screen appears and on app resume.
  Future<void> refreshPermissions() async {
    final contact = await Permission.contacts.status;
    final notif = await Permission.notification.status;
    state = state.copyWith(
      contactPermission: contact.isGranted || contact.isLimited,
      notificationPermission: notif.isGranted || notif.isProvisional,
    );
  }

  Future<void> setAppLock(bool v) async {
    state = state.copyWith(appLock: v);
    await SettingsPrefs.write(SettingsPrefs.kLock, v);
  }

  Future<void> setDarkTheme(bool v) async {
    state = state.copyWith(darkTheme: v);
    await SettingsPrefs.write(SettingsPrefs.kDark, v);
  }
}
