import 'package:base_clean_architecture/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parseStringToInt', () {
    test('when value is a valid integer string', () {
      final value = ParseUtils.parseStringToInt('123');

      expect(value, equals(123));
    });

    test('when value is not a valid integer string', () {
      const value = 'abc';

      expect(() => ParseUtils.parseStringToInt(value), throwsA(isA<ParseException>()));
    });
  });

  group('parseStringToDouble', () {
    test('when value is a valid double string', () {
      final value = ParseUtils.parseStringToDouble('123.45');

      expect(value, equals(123.45));
    });

    test('when value is not a valid double string', () {
      const value = 'abc';

      expect(() => ParseUtils.parseStringToDouble(value), throwsA(isA<ParseException>()));
    });
  });
}
