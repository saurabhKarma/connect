/// Normalizes device-book phone numbers to E.164 (India-first) for the backend.
class PhoneUtil {
  static const String defaultCode = '+91';

  static String toE164(String raw) {
    final trimmed = raw.replaceAll(RegExp(r'\s|-|\(|\)'), '');
    if (trimmed.startsWith('+')) return trimmed;
    final digits = trimmed.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length == 10) return '$defaultCode$digits';
    if (digits.length == 11 && digits.startsWith('0')) return '$defaultCode${digits.substring(1)}';
    if (digits.length == 12 && digits.startsWith('91')) return '+$digits';
    return '+$digits';
  }
}
