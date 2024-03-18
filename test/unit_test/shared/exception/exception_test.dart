import 'package:base_clean_architecture/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidationException message', () {
    test('when kind is ValidationExceptionKind.emptyEmail', () async {
      final result = const ValidationException(ValidationExceptionKind.emptyEmail).message;
      expect(result, 'Email đang bỏ trống');
      // expect(result, l10n.emptyEmail);
    });

    test('when kind is ValidationExceptionKind.invalidEmail', () async {
      final result = const ValidationException(ValidationExceptionKind.invalidEmail).message;
      expect(result, 'Không đúng định dạng email');
    });

    test('when kind is ValidationExceptionKind.invalidPassword', () async {
      final result = const ValidationException(ValidationExceptionKind.invalidPassword).message;
      expect(result, 'Không đúng định dạng mật khẩu');
    });

    test('when kind is ValidationExceptionKind.invalidUserName', () async {
      final result = const ValidationException(ValidationExceptionKind.invalidUserName).message;
      expect(result, 'Không đúng định dạng username');
    });

    test('when kind is ValidationExceptionKind.invalidPhoneNumber', () async {
      final result = const ValidationException(ValidationExceptionKind.invalidPhoneNumber).message;
      expect(result, 'Số điện thoại gồm 10 chữ số');
    });

    test('when kind is ValidationExceptionKind.invalidDateTime', () async {
      final result = const ValidationException(ValidationExceptionKind.invalidDateTime).message;
      expect(result, 'Không đúng định dạng ngày');
    });

    test('when kind is ValidationExceptionKind.passwordsAreNotMatch', () async {
      final result =
          const ValidationException(ValidationExceptionKind.passwordsAreNotMatch).message;
      expect(result, 'Mật khẩu không trùng khớp');
    });
  });

  group('ParseException message', () {
    test('when kind is ParseExceptionKind.invalidSourceFormat', () async {
      final result = const ParseException(ParseExceptionKind.invalidSourceFormat, null).message;
      expect(result, 'Lỗi phân tích dữ liệu');
    });
  });

  group('NetworkingException message', () {
    test('when networkExceptions is NetworkExceptions.requestCancelled()', () {
      final exception =
          NetworkingException(networkExceptions: const NetworkExceptions.requestCancelled())
              .message;
      expect(exception, equals('Yêu cầu đã bị hủy'));
    });

    //...
  });
}
