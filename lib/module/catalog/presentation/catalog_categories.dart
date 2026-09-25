import 'package:connect/l10n/app_localizations.dart';

/// Store category values persisted on the backend (English), with localized labels.
const List<String> kCatalogCategories = [
  'Fashion',
  'Grocery',
  'Electronics',
  'Food',
  'Home',
  'Beauty',
  'Services',
  'Other',
];

String localizedCategory(AppLocalizations l10n, String value) {
  switch (value) {
    case 'Fashion':
      return l10n.catFashion;
    case 'Grocery':
      return l10n.catGrocery;
    case 'Electronics':
      return l10n.catElectronics;
    case 'Food':
      return l10n.catFood;
    case 'Home':
      return l10n.catHome;
    case 'Beauty':
      return l10n.catBeauty;
    case 'Services':
      return l10n.catServices;
    default:
      return l10n.catOther;
  }
}
