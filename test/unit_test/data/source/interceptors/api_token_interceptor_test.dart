import 'package:base_clean_architecture/data/data.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common/common.dart';

void main() {
  late ApiTokenInterceptor apiTokenInterceptor;
  late RequestOptions options;
  late RequestInterceptorHandler handler;

  setUp(() {
    apiTokenInterceptor = ApiTokenInterceptor(appInfo, deviceHelper, appPreferences);
    options = RequestOptions(path: '/path');
    handler = RequestInterceptorHandler();

    when(() => appInfo.versionName).thenReturn('1.0.0');
    when(() => appInfo.versionCode).thenReturn('1');
    when(() => deviceHelper.operatingSystem).thenReturn('android');
  });

  group('onRequest', () {
    test('when `headers` is not empty && `accessToken` is empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => '');

      const headers = {
        'os': 'android',
      };
      options.headers.addAll(headers);
      await apiTokenInterceptor.onRequest(options, handler);

      !kIsWeb
          ? expect(options.headers, {
              Constants.userAgentKey: 'android - 1.0.0(1)',
              'os': 'android',
            })
          : expect(options.headers, {
              Constants.userAgentKey: '1.0.0(1)',
              'os': 'android',
            });
    });

    test('when `headers` is  empty && `accessToken` is not empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => 'token');

      await apiTokenInterceptor.onRequest(options, handler);

      expect(options.headers, {
        Constants.userAgentKey: 'android - 1.0.0(1)',
        Constants.basicAuthorization: '${Constants.bearer} token',
      });
    });

    test('when `headers` && `accessToken` is empty', () async {
      when(() => appPreferences.accessToken).thenAnswer((_) async => '');

      await apiTokenInterceptor.onRequest(options, handler);

      expect(options.headers, {
        Constants.userAgentKey: 'android - 1.0.0(1)',
      });
    });
  });

  // test(
  //       'should throw RemoteException.refreshTokenFailed when API throw DioException.unknown with `error` is RemoteException.refreshTokenFailed',
  //       () async {
  //         // arrange
  //         const method = RestMethod.get;
  //         const path = '/v1/auth/login';
  //         const baseUrl = 'https://example.com/api';
  //         final restApiClient = RestApiClient(
  //           dio: _mockDio,
  //           errorResponseMapperType: ErrorResponseMapperType.jsonObject,
  //           successResponseMapperType: SuccessResponseMapperType.jsonObject,
  //         );

  //         // stub
  //         when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: baseUrl));
  //         when(
  //           () => _mockDio.get<dynamic>(
  //             path,
  //             options: any(named: 'options'),
  //           ),
  //         ).thenThrow(
  //           DioException(
  //             type: DioExceptionType.unknown,
  //             requestOptions: RequestOptions(),
  //             error: const RemoteException(kind: RemoteExceptionKind.refreshTokenFailed),
  //           ),
  //         );

  //         // act
  //         final call = restApiClient.request(
  //           method: method,
  //           path: path,
  //           decoder: (json) => MockData.fromJson(json as Map<String, dynamic>),
  //         );

  //         // assert
  //         expect(
  //           call,
  //           throwsA(
  //             isA<RemoteException>().having(
  //               (e) => e.kind,
  //               'kind',
  //               RemoteExceptionKind.refreshTokenFailed,
  //             ),
  //           ),
  //         );
  //       },
  //     );
}
