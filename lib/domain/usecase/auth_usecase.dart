import 'package:injectable/injectable.dart';

import '../../shared/shared.dart';
import '../domain.dart';

@injectable
class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<void> loginUsecase({required String username, required String password}) async {
    if (!ValidationUtils.isNotEmpty(username)) {
      throw const ValidationException(ValidationExceptionKind.invalidUserName);
    }

    if (!ValidationUtils.isNotEmpty(password)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }

    await _authRepository.login(username: username, password: password);
  }

  Future<void> resetPasswordUsecase({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (!ValidationUtils.isNotEmpty(password)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }
    if (!ValidationUtils.isNotEmpty(confirmPassword)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }
    if (password != confirmPassword) {
      throw const ValidationException(ValidationExceptionKind.passwordsAreNotMatch);
    }
    if (!ValidationUtils.isValidEmail(email)) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }

    await _authRepository.resetPassword(
      token: token,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  Future<void> forgotPasswordUsecase(String email) async {
    if (!ValidationUtils.isNotEmpty(email)) {
      throw const ValidationException(ValidationExceptionKind.emptyEmail);
    }
    if (!ValidationUtils.isValidEmail(email)) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }
    await _authRepository.forgotPassword(email);
  }

  Future<void> registerUsecase({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) async {
    if (!ValidationUtils.isNotEmpty(email)) {
      throw const ValidationException(ValidationExceptionKind.emptyEmail);
    }

    if (!ValidationUtils.isValidEmail(email)) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }

    if (!ValidationUtils.isNotEmpty(password)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }

    await _authRepository.register(
      email: email,
      username: username,
      password: password,
      gender: gender,
    );
  }
}
