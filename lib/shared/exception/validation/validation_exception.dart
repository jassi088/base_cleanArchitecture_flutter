import '../base/app_exception.dart';

class ValidationException extends AppException {
  const ValidationException(this.kind) : super(AppExceptionType.validation);

  final ValidationExceptionKind kind;

  @override
  String get message => switch (kind) {
        ValidationExceptionKind.emptyEmail => 'Email đang bỏ trống',
        ValidationExceptionKind.invalidEmail => 'Không đúng định dạng email',
        ValidationExceptionKind.invalidPassword => 'Không đúng định dạng mật khẩu',
        ValidationExceptionKind.invalidUserName => 'Không đúng định dạng username',
        ValidationExceptionKind.invalidPhoneNumber => 'Số điện thoại gồm 10 chữ số',
        ValidationExceptionKind.invalidDateTime => 'Không đúng định dạng ngày',
        ValidationExceptionKind.passwordsAreNotMatch => 'Mật khẩu không trùng khớp',
      };

  @override
  String toString() => 'ValidationException: {kind: $kind}';
}

enum ValidationExceptionKind {
  invalidEmail,
  emptyEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
}
