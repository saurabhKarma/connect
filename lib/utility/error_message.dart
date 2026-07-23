import 'package:connect/exception/api_exception.dart';

/// Maps any thrown error to a short, user-friendly message for toasts/UI.
/// Keeps raw exception details (class name, status codes) out of the UI.
String friendlyError(Object error) {
  if (error is ApiException) return error.message;
  return 'Something went wrong. Please try again.';
}
