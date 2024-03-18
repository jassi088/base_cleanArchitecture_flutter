import 'package:base_clean_architecture/shared/shared.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumExtensions', () {
    group('plus', () {
      test('when num is 1 and other is 2', () {
        const num number = 1;
        final result = number.plus(2);
        expect(result, 3);
      });
    });

    group('minus', () {
      test('when num is 3 and other is 2', () {
        const num number = 3;
        final result = number.minus(2);
        expect(result, 1);
      });
    });

    group('times', () {
      test('when num is 3 and other is 2', () {
        const num number = 3;
        final result = number.times(2);
        expect(result, 6);
      });
    });

    group('div', () {
      test('when num is 6 and other is 2', () {
        const num number = 6;
        final result = number.div(2);
        expect(result, 3);
      });
    });
  });

  group('IntExtensions', () {
    group('plus', () {
      test('when int is 1 and other is 2', () {
        const int number = 1;
        final result = number.plus(2);
        expect(result, 3);
      });
    });

    group('minus', () {
      test('when int is 3 and other is 2', () {
        const int number = 3;
        final result = number.minus(2);
        expect(result, 1);
      });
    });

    group('times', () {
      test('when int is 3 and other is 2', () {
        const int number = 3;
        final result = number.times(2);
        expect(result, 6);
      });
    });

    group('div', () {
      test('when int is 6 and other is 2', () {
        const int number = 6;
        final result = number.div(2);
        expect(result, 3);
      });
    });

    group('truncateDiv', () {
      test('when int is 6 and other is 2', () {
        const int number = 6;
        final result = number.truncateDiv(2);
        expect(result, 3);
      });
    });
  });

  group('DoubleExtensions', () {
    group('plus', () {
      test('when double is 1 and other is 2', () {
        const double number = 1;
        final result = number.plus(2);
        expect(result, 3);
      });
    });

    group('minus', () {
      test('when double is 3 and other is 2', () {
        const double number = 3;
        final result = number.minus(2);
        expect(result, 1);
      });
    });

    group('times', () {
      test('when double is 3 and other is 2', () {
        const double number = 3;
        final result = number.times(2);
        expect(result, 6);
      });
    });

    group('div', () {
      test('when double is 6 and other is 2', () {
        const double number = 6;
        final result = number.div(2);
        expect(result, 3);
      });
    });
  });
}
