import '../../shared.dart';

class NetworkException extends AppException {
  final ApiException apiException;

  NetworkException(this.apiException) : super(AppExceptionType.remote);

  @override
  String toString() {
    return 'NetworkException: {apiException: $apiException}';
  }
}
