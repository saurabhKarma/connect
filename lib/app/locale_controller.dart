import 'package:connect/utility/locale_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supported languages. Add a locale here + an ARB file to support a new one.
const supportedLanguages = <Locale>[
  Locale('en'),
  Locale('hi'),
];

/// Holds the current app locale (independent of the device locale).
/// Initialized from persisted storage (via an override in main) and persists
/// on every change, so the choice is remembered.
final localeControllerProvider =
    NotifierProvider<LocaleController, Locale>(() => LocaleController(const Locale('en')));

class LocaleController extends Notifier<Locale> {
  LocaleController(this._initial);

  final Locale _initial;

  @override
  Locale build() => _initial;

  Future<void> setLocale(Locale locale) async {
    if (locale.languageCode == state.languageCode) return;
    state = locale;
    await LocalePrefs.setLanguageCode(locale.languageCode);
  }

  Future<void> toggle() {
    return setLocale(state.languageCode == 'hi' ? const Locale('en') : const Locale('hi'));
  }
}
