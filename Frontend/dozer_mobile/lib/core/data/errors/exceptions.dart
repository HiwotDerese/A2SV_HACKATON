import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String message;

  const AppException(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerException extends AppException {
  const ServerException({required String message}) : super(message);
}

class CacheException extends AppException {
  const CacheException({required String message}) : super(message);
}

class UserNotFoundException extends AppException {
  const UserNotFoundException({required String message}) : super(message);
}



class NoInternetException extends AppException {
  const NoInternetException({required String message}) : super(message);
}

class UnAuthorizedException extends AppException {
  const UnAuthorizedException({required String message}) : super(message);
}

class InvalidInputException extends AppException {
  const InvalidInputException({required String message}) : super(message);
}

class InternalServerException extends AppException {
  const InternalServerException({required String message}) : super(message);
}

class UnknownException extends AppException {
  const UnknownException({required String message}) : super(message);
}

class ConnectionTimeoutException extends AppException {
  const ConnectionTimeoutException({required String message}) : super(message);
}

class NotFoundException extends AppException {
  const NotFoundException({required String message}) : super(message);
}

class BadRequestException extends AppException {
  const BadRequestException({required String message}) : super(message);
}

class ForbiddenException extends AppException {
  const ForbiddenException({required String message}) : super(message);
}

class UnProcessableEntityException extends AppException {
  const UnProcessableEntityException({required String message})
      : super(message);
}

class DataSourceException extends AppException {
  const DataSourceException({required String message}) : super(message);
}

class ValidationException extends AppException {
  const ValidationException({required String message}) : super(message);
}
