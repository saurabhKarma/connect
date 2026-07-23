import 'package:connect/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

/// Ergonomic access to localized strings: `context.l10n.login`.
extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
