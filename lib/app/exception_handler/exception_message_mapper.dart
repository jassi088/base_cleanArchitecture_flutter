import '../../shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote => switch ((appException as NetworkingException).networkExceptions) {
          NetworkExceptions.requestCancelled => 'Yêu cầu đã bị hủy',
          NetworkExceptions.unauthorizedRequest => 'Yêu cầu không được phép',
          NetworkExceptions.badRequest => 'Yêu cầu không hợp lệ',
          NetworkExceptions.notFound => 'Không tìm thấy',
          NetworkExceptions.methodNotAllowed => 'Phương thức không được phép',
          NetworkExceptions.requestTimeout => 'Yêu cầu đã hết thời gian chờ',
          NetworkExceptions.sendTimeout => 'Yêu cầu đã hết thời gian gửi',
          NetworkExceptions.conflict => 'Xung đột',
          NetworkExceptions.internalServerError => 'Lỗi máy chủ nội bộ',
          NetworkExceptions.notImplemented => 'Chưa được triển khai',
          NetworkExceptions.serviceUnavailable => 'Dịch vụ không khả dụng',
          NetworkExceptions.noInternetConnection => 'Không có kết nối internet',
          NetworkExceptions.formatException => 'Lỗi định dạng',
          NetworkExceptions.unableToProcess => 'Không thể xử lý yêu cầu',
          NetworkExceptions.defaultError => 'Lỗi mặc định',
          NetworkExceptions.unexpectedError => 'Lỗi không mong đợi',
          NetworkExceptions() => '',
        },
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
