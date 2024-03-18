import 'package:base_clean_architecture/data/data.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common/common.dart';

void main() {
  late ApiTokenInterceptor apiTokenInterceptor;
  late RequestOptions options;
  late RequestInterceptorHandler handler;

  setUp(() {
    apiTokenInterceptor = ApiTokenInterceptor(appInfo, appPreferences);
    options = RequestOptions(path: '/path');
    handler = RequestInterceptorHandler();

    when(() => appInfo.versionName).thenReturn('1.0.0');
    when(() => appInfo.versionCode).thenReturn('1');
  });

  group('onRequest', () {
    test('when `headers` is not empty && `accessToken` is empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => '');

      const headers = {
        'os': 'android',
      };
      options.headers.addAll(headers);
      await apiTokenInterceptor.onRequest(options, handler);

      expect(options.headers, {
        Constants.userAgentKey: '1.0.0(1)',
        'os': 'android',
      });
    });

    test('when `headers` is  empty && `accessToken` is not empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => 'token');

      await apiTokenInterceptor.onRequest(options, handler);

      expect(options.headers, {
        Constants.userAgentKey: '1.0.0(1)',
        Constants.basicAuthorization: '${Constants.bearer} token',
      });
    });

    test('when `headers` && `accessToken` is empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => '');

      await apiTokenInterceptor.onRequest(options, handler);

      expect(options.headers, {
        Constants.userAgentKey: '1.0.0(1)',
      });
    });
  });
}
