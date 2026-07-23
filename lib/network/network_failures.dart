sealed class Failure {
  final String message;
  final int? statusCode;
  final dynamic data;

  const Failure({required this.message, this.statusCode, this.data});

  @override
  String toString() => message;
}

/// Network-related failures (no internet, timeout, etc.)
final class NetworkFailure extends Failure {
  const NetworkFailure(String message, {super.statusCode, super.data})
      : super(message: message);
}

/// Server-related failures (500, 503, etc.)
final class ServerFailure extends Failure {
  const ServerFailure(String message, {super.statusCode, super.data})
      : super(message: message);
}

/// Client-related failures (400, 401, 403, 404, etc.)
final class ClientFailure extends Failure {
  const ClientFailure(String message, {super.statusCode, super.data})
      : super(message: message);
}

/// Parse/serialization failures
final class ParseFailure extends Failure {
  const ParseFailure(String message, {super.data}) : super(message: message);
}

/// Authentication failures
final class AuthFailure extends Failure {
  const AuthFailure(String message, {super.statusCode}) : super(message: message);
}

/// Cache-related failures
final class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message: message);
}

/// Unknown/unexpected failures
final class UnknownFailure extends Failure {
  const UnknownFailure(String message, {super.data}) : super(message: message);
}
