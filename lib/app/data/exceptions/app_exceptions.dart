class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '${prefix ?? ''}${message ?? ''}';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection: ');
}

class TimeOutException extends AppException {
  TimeOutException([String? message])
      : super(message, '️Request Timed Out: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, '400 Bad Request: ');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, '401 Unauthorized: ');
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message, '404 Not Found: ');
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message, '500 Internal Server Error: ');
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Fetch Data Error: ');
}
