import 'package:base_clean_architecture/data/data.dart';
import 'package:base_clean_architecture/domain/domain.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common/common.dart';

class _MockAuthApi extends Mock implements AuthApi {}

void main() {
  late AuthRepositoryImpl authRepositoryImpl;
  late AuthApi _mockAuthApi;

  setUp(() {
    _mockAuthApi = _MockAuthApi();
    authRepositoryImpl = AuthRepositoryImpl(_mockAuthApi, appPreferences);
  });

  group('test `login` function', () {
    test(
      'login - successful login save access_token',
      () async {
        const username = 'test_user';
        const password = 'test_password';
        const User user = User(token: 'token');

        when(() => _mockAuthApi.login({'username': username, 'password': password}))
            .thenAnswer((_) async => user);
        when(() => appPreferences.saveAccessToken(user.token)).thenAnswer((_) async {});

        await authRepositoryImpl.login(username: username, password: password);

        verify(() => appPreferences.saveAccessToken(user.token)).called(1);
      },
    );

    test(
      'login - successful login but does not save access_token in response data',
      () async {
        const username = 'test_user';
        const password = 'test_password';

        when(() => _mockAuthApi.login({'username': username, 'password': password}))
            .thenAnswer((_) async => const User(token: ''));

        await authRepositoryImpl.login(username: username, password: password);

        verifyNever(() => appPreferences.saveAccessToken(any()));
      },
    );

    test('login - throws DioException on failure', () async {
      const username = 'test_user';
      const password = 'test_password';
      final error = DioException(
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/path'),
          statusCode: 400,
          data: {
            'message': 'Username or password is incorrect',
          },
        ),
        requestOptions: RequestOptions(),
      );

      when(() => _mockAuthApi.login({'username': username, 'password': password})).thenThrow(error);

      final call = authRepositoryImpl.login(username: username, password: password);

      expect(
        call,
        throwsA(
          isA<NetworkingException>().having(
            (e) => e.networkExceptions,
            'networkExceptions',
            const NetworkExceptions.badRequest('Username or password is incorrect'),
          ),
        ),
        // chỉ so sánh type
        // throwsA(const TypeMatcher<NetworkingException>()),
      );
    });
  });
}
