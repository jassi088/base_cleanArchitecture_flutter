import '../../shared.dart';

class NetworkingException extends AppException {
  final NetworkExceptions? networkExceptions;

  NetworkingException({this.networkExceptions}) : super(AppExceptionType.remote);

  @override
  String toString() {
    return 'NetworkingException: {networkExceptions: $networkExceptions}';
  }
}
