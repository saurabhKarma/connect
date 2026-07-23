abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class ClientException extends AppException {
  const ClientException(super.message, {super.statusCode});
}

class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

class AuthExpiredException extends AppException {
  const AuthExpiredException() : super('Session expired');
}

class UnknownException extends AppException {
  const UnknownException(super.message);
}
