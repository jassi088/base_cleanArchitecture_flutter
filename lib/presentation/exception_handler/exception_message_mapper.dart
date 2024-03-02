import '../../shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote => (appException as NetworkingException).networkExceptions.when(
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
          ),
      AppExceptionType.parse => 'Lỗi phân tích dữ liệu',
      AppExceptionType.validation => switch ((appException as ValidationException).kind) {
          ValidationExceptionKind.emptyEmail => 'Email đang bỏ trống',
          ValidationExceptionKind.invalidEmail => 'Không đúng định dạng email',
          ValidationExceptionKind.invalidPassword => 'Không đúng định dạng mật khẩu',
          ValidationExceptionKind.invalidUserName => 'Không đúng định dạng username',
          ValidationExceptionKind.invalidPhoneNumber => 'Số điện thoại gồm 10 chữ số',
          ValidationExceptionKind.invalidDateTime => 'Không đúng định dạng ngày',
          ValidationExceptionKind.passwordsAreNotMatch => 'Mật khẩu không trùng khớp',
        },
    };
  }
}
