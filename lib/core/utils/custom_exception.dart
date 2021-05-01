import 'package:pub_tran_exercise/globals/constants.dart';

class CustomException implements Exception {
  final message;
  final prefix;

  CustomException({this.prefix, this.message});

  String toString() {
    return "$prefix : $message";
  }
}

class NoInternetConnectionException extends CustomException {
  NoInternetConnectionException({
    String prefix = kConnectionError,
    String message = kConnectionMsg,
  }) : super(prefix: prefix, message: message);
}

class FetchDataException extends CustomException {
  FetchDataException({String message = ''})
      : super(prefix: "Error During Communication: ", message: message);
}

class BadRequestException extends CustomException {
  BadRequestException({String message = ''})
      : super(prefix: "Bad request exception: ", message: message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException({String message = ''})
      : super(prefix: 'Unauthorized exception', message: message);
}

class NoContentException extends CustomException {
  NoContentException({String message = ''})
      : super(prefix: 'No content exception', message: message);
}

class ForbiddenException extends CustomException {
  ForbiddenException({String message = ''})
      : super(prefix: 'Forbidden exception', message: message);
}

class NotFoundException extends CustomException {
  NotFoundException({String message = ''})
      : super(prefix: 'Not found exception', message: message);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException({String message = ''})
      : super(prefix: 'Internal server error exception', message: message);
}

class NotImplementedException extends CustomException {
  NotImplementedException({String message = ''})
      : super(prefix: 'Not implemented exception', message: message);
}

class NullException extends CustomException {
  NullException({String message = ''})
      : super(prefix: 'Null exception', message: message);
}
