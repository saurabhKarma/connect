/// Formats a product price, e.g. 799.0 + "INR" -> "₹799". Trailing ".00" is dropped.
String formatPrice(double? price, String currency) {
  if (price == null) return '';
  final symbol = _symbol(currency);
  final whole = price == price.roundToDouble()
      ? price.toStringAsFixed(0)
      : price.toStringAsFixed(2);
  return '$symbol$whole';
}

String _symbol(String currency) {
  switch (currency.toUpperCase()) {
    case 'INR':
      return '₹';
    case 'USD':
      return '\$';
    case 'EUR':
      return '€';
    default:
      return '$currency ';
  }
}
