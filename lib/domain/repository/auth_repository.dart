import '../domain.dart';

abstract class AuthRepository {
  Future<void> login({required String username, required String password});

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<void> forgotPassword(String email);

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  });
}
