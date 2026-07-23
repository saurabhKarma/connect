import 'package:intl/intl.dart';

extension PriceExtension on num {
  String toPrice({String symbol = '₹'}) {
    final formatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: symbol,
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
}