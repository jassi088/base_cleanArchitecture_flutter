import 'package:base_clean_architecture/data/data.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppInfo extends Mock implements AppInfo {}

class _MockAppPreferences extends Mock implements AppPreferences {}

class _MockDio extends Mock implements Dio {}

void main() {
  final appPreferences = _MockAppPreferences();
  final appInfo = _MockAppInfo();

  group('createDio', () {
    test('when specifying `connectTimeout`, `receiveTimeout`, `sendTimeout`, `baseUrl`', () async {
      final dio = NetworkingFactory.createDio(
        options: BaseOptions(
          connectTimeout: 1.seconds,
          receiveTimeout: 2.seconds,
          sendTimeout: 3.seconds,
          baseUrl: 'https://google.com',
        ),
      );

      expect(dio.options.connectTimeout, 1.seconds);
      expect(dio.options.receiveTimeout, 2.seconds);
      expect(dio.options.sendTimeout, 3.seconds);
      expect(dio.options.baseUrl, 'https://google.com');
    });

    test(
      'when not specifying `connectTimeout`, `receiveTimeout`, `sendTimeout`, `baseUrl`',
      () async {
        final dio = NetworkingFactory.createDio();

        expect(dio.options.connectTimeout, Constants.connectTimeout);
        expect(dio.options.receiveTimeout, Constants.receiveTimeout);
        expect(dio.options.sendTimeout, Constants.sendTimeout);
        expect(dio.options.baseUrl, UrlConstants.appApiBaseUrl);
      },
    );

    test('when `interceptors` is empty', () async {
      final defaultInterceptorLength = Dio().interceptors.length;
      final dio = NetworkingFactory.createDio(interceptors: (dio) => []);

      expect(dio.interceptors.length, defaultInterceptorLength);
    });

    test('when `interceptors` is not empty', () async {
      final defaultInterceptorLength = Dio().interceptors.length;

      final customLogInterceptor = CustomLogInterceptor();
      final connectivityInterceptor = ConnectivityInterceptor();
      final retryOnErrorInterceptor = RetryOnErrorInterceptor(_MockDio());
      final apiTokenInterceptor = ApiTokenInterceptor(appInfo, appPreferences);
      final dio = NetworkingFactory.createDio(
        interceptors: (dio) => [
          connectivityInterceptor,
          apiTokenInterceptor,
          retryOnErrorInterceptor,
          customLogInterceptor,
        ],
      );

      expect(dio.interceptors.length, 4 + defaultInterceptorLength);
      expect(dio.interceptors[dio.interceptors.length - 1], customLogInterceptor); // add last
      expect(dio.interceptors[dio.interceptors.length - 2], apiTokenInterceptor);
      expect(dio.interceptors[dio.interceptors.length - 3], connectivityInterceptor);
      expect(dio.interceptors[dio.interceptors.length - 4], retryOnErrorInterceptor); // add first
    });
  });
}
