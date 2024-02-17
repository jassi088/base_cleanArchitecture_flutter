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
      await _appPreferences.saveAccessToken(response.token);
      print('✔✔ ${response.toString()}');
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

  // @override
  // Future<LoginResponse> login(String code) async {
  //   final res = await _authApi.login(
  //     code: code,
  //     redirectUrl: Configurations.callbackUrl,
  //   );
  //   return res.data;
  // }

  // @override
  // Future<User> getCurrentUser() async {
  //   final res = await _authApi.getCurrentUser();
  //   return res.data;
  // }

  // @override
  // Future<bool> logout() async {
  //   final res = await _authApi.logout();
  //   return res.success;
  // }
}
