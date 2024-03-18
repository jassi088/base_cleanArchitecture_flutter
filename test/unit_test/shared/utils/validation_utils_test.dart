import 'package:base_clean_architecture/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isNotEmpty', () {
    test('when String isNotEmpty', () {
      final isValid = ValidationUtils.isNotEmpty('@buzzlp19');

      expect(isValid, true);
    });

    test('when String isEmpty', () {
      final isValid = ValidationUtils.isNotEmpty('');

      expect(isValid, false); // Sửa từ true thành false
    });
  });

  group('isValidEmail', () {
    test('when email is buzzlp19@gmail.com.vn', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19@gmail.com.vn');

      expect(isValid, true);
    });

    test('when email is buzzlp19@gmail.com', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19@gmail.com');

      expect(isValid, true);
    });

    test('when email contains whitespace at the beginning', () {
      final isValid = ValidationUtils.isValidEmail('  buzzlp19@gmail.com');

      expect(isValid, equals(true));
    });

    test('when email contains whitespace at the end', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19@gmail.com  ');

      expect(isValid, equals(true));
    });

    test('when email contains whitespace', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19 @gmail.com');

      expect(isValid, equals(false));
    });

    test('when email does not contain @', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19gmail.com');

      expect(isValid, equals(false));
    });

    test('when email does not contain .', () {
      final isValid = ValidationUtils.isValidEmail('buzzlp19@gmailcom');

      expect(isValid, equals(false));
    });

    test('when email contains invalid characters', () {
      final isValid = ValidationUtils.isValidEmail('!duynn@gmail.com');

      expect(isValid, equals(false));
    });
  });

  group('isValidPassword', () {
    test('when password lenth = 6', () {
      final isValid = ValidationUtils.isValidPassword('123456');

      expect(isValid, equals(true));
    });

    test('when password length = 5', () {
      final isValid = ValidationUtils.isValidPassword('12345');

      expect(isValid, equals(false));
    });

    test('when password contains whitespace', () {
      final isValid = ValidationUtils.isValidPassword('123 45');

      expect(isValid, equals(false));
    });
  });

  group('isValidPhoneNumber', () {
    test('when phoneNumber is valid', () {
      final isValid = ValidationUtils.isValidPhoneNumber('+84912345678');

      expect(isValid, true);
    });

    test('when phoneNumber contains whitespace at the begin,end', () {
      final isValid = ValidationUtils.isValidPhoneNumber(' +84912345678 ');

      expect(isValid, true);
    });

    test('when phoneNumber is valid with 11 digits', () {
      final isValid = ValidationUtils.isValidPhoneNumber('09123456789');

      expect(isValid, true);
    });

    test('when phoneNumber is valid with leading zero', () {
      final isValid = ValidationUtils.isValidPhoneNumber('0123456789');

      expect(isValid, true);
    });

    test('when phoneNumber is invalid', () {
      final isValid = ValidationUtils.isValidPhoneNumber('invalid');

      expect(isValid, false);
    });

    test('when phoneNumber is too short', () {
      final isValid = ValidationUtils.isValidPhoneNumber('123');

      expect(isValid, false);
    });

    test('when phoneNumber is too long', () {
      final isValid = ValidationUtils.isValidPhoneNumber('123456789012');

      expect(isValid, false);
    });

    test('when phoneNumber contains special characters', () {
      final isValid = ValidationUtils.isValidPhoneNumber('+84-912-345-678');

      expect(isValid, false);
    });
  });

  group('isValidDateTime', () {
    test('when dateTime is valid with format dd/mm/yyyy', () {
      final isValid = ValidationUtils.isValidDateTime('31/12/2022');
      expect(isValid, true);
    });

    test('when dateTime is valid with format dd-mm-yyyy', () {
      final isValid = ValidationUtils.isValidDateTime('01-01-2023');
      expect(isValid, true);
    });

    test('when dateTime is valid with format dd.mm.yyyy', () {
      final isValid = ValidationUtils.isValidDateTime('15.07.2024');
      expect(isValid, true);
    });

    test('when dateTime is valid with leap year', () {
      final isValid = ValidationUtils.isValidDateTime('29/02/2024');
      expect(isValid, true);
    });

    test('when dateTime is invalid', () {
      final isValid = ValidationUtils.isValidDateTime('32/12/2022');
      expect(isValid, false);
    });
  });

  group('isAlphanumeric', () {
    test('when text is alphanumeric', () {
      final isValid = ValidationUtils.isAlphanumeric('abc123');
      expect(isValid, true);
    });

    test('when text contains special characters', () {
      final isValid = ValidationUtils.isAlphanumeric('abc!@#');
      expect(isValid, false);
    });

    test('when text contains spaces', () {
      final isValid = ValidationUtils.isAlphanumeric('abc 123');
      expect(isValid, false);
    });

    test('when text is empty', () {
      final isValid = ValidationUtils.isAlphanumeric('');
      expect(isValid, false);
    });
  });

  group('isLink', () {
    test('when text is a valid link', () {
      final isValid = ValidationUtils.isLink('https://example.com');
      expect(isValid, true);
    });

    test('when text is not a valid link', () {
      final isValid = ValidationUtils.isLink('not_a_link');
      expect(isValid, false);
    });

    test('when text is empty', () {
      final isValid = ValidationUtils.isLink('');
      expect(isValid, false);
    });
  });
}
