import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final AppPreferences _appPreferences;

  AuthRepositoryImpl(this._authApi, this._appPreferences);

  @override
  Future<void> login({required String username, required String password}) async {
    try {
      final response = await _authApi.login({'username': username, 'password': password});
      if (response.token != '') {
        await _appPreferences.saveAccessToken(response.token);
        await _appPreferences.saveRefreshToken(response.token);
      }
    } catch (e) {
      throw DioExceptionMapper().map(e);
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) {
    throw UnimplementedError();
  }
}
