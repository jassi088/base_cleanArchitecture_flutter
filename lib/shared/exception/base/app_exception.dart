abstract class AppException implements Exception {
  const AppException(this.appExceptionType);

  final AppExceptionType appExceptionType;

  String get message;

  @override
  String toString() => 'message: $message';
}

enum AppExceptionType {
  remote,
  parse,
  validation,
}
