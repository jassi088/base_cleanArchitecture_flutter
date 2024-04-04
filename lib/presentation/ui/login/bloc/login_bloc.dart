import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc(this._authUsecase) : super(const LoginState()) {
    on<EmailTextFieldChanged>(_onEmailTextFieldChanged, transformer: distinct());

    on<PasswordTextFieldChanged>(_onPasswordTextFieldChanged, transformer: distinct());

    on<LoginButtonPressed>(_onLoginButtonPressed, transformer: log());

    on<EyeIconPressed>(_onEyeIconPressed, transformer: log());
  }

  final AuthUsecase _authUsecase;

  bool _isLoginButtonEnabled(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  void _onEmailTextFieldChanged(EmailTextFieldChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
      isLoginButtonEnabled: _isLoginButtonEnabled(event.email, state.password),
      onPageError: '',
    ));
  }

  void _onPasswordTextFieldChanged(PasswordTextFieldChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
      isLoginButtonEnabled: _isLoginButtonEnabled(state.email, event.password),
      onPageError: '',
    ));
  }

  FutureOr<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) {
    return runBlocCatching(
      action: () async {
        await _authUsecase.loginUsecase(username: state.email, password: state.password);
        if (state.onPageError == '') navigator.showSuccessSnackBar('Login successfully');
        await navigator.replace(const MainRoute());
      },
      doOnError: (e) async {
        emit(state.copyWith(onPageError: e.message));
      },
    );
  }

  void _onEyeIconPressed(EyeIconPressed event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }
}
