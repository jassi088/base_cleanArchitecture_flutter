import '../../shared.dart';

class NetworkingException extends AppException {
  final NetworkExceptions networkExceptions;

  NetworkingException({required this.networkExceptions}) : super(AppExceptionType.remote);

  @override
  String get message => networkExceptions.when(
        requestCancelled: () => 'Yêu cầu đã bị hủy',
        unauthorizedRequest: (error) => 'Yêu cầu không được phép: $error',
        badRequest: (error) => 'Yêu cầu không hợp lệ: $error',
        notFound: (error) => 'Không tìm thấy: $error',
        methodNotAllowed: () => 'Phương thức không được phép',
        requestTimeout: () => 'Yêu cầu đã hết thời gian chờ',
        sendTimeout: () => 'Yêu cầu đã hết thời gian gửi',
        conflict: () => 'Xung đột',
        internalServerError: () => 'Lỗi máy chủ nội bộ',
        notImplemented: () => 'Chưa được triển khai',
        serviceUnavailable: () => 'Dịch vụ không khả dụng',
        noInternetConnection: () => 'Không có kết nối internet',
        formatException: () => 'Lỗi định dạng',
        unableToProcess: () => 'Không thể xử lý yêu cầu',
        defaultError: (error) => 'Lỗi mặc định: $error',
        unexpectedError: () => 'Lỗi không mong đợi',
      );

  @override
  String toString() => 'NetworkingException: {networkExceptions: $networkExceptions}';
}
