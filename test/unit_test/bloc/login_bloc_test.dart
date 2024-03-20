import 'package:base_clean_architecture/app/app.dart';
import 'package:base_clean_architecture/domain/domain.dart';
import 'package:base_clean_architecture/presentation/presentation.dart';
import 'package:base_clean_architecture/shared/shared.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppNavigator extends Mock implements AppNavigator {}

class _MockAuthUseCase extends Mock implements AuthUsecase {}

class _MockCommonBloc extends Mock implements CommonBloc {}

void main() {
  group('LoginBloc', () {
    late LoginBloc bloc;
    final _mockAuthUsecase = _MockAuthUseCase();
    final _navigator = _MockAppNavigator();
    final _commonBloc = _MockCommonBloc();

    setUp(() {
      bloc = LoginBloc(_mockAuthUsecase);
      bloc.navigator = _navigator;
      bloc.commonBloc = _commonBloc;
    });

    test('correct initialState', () {
      expect(bloc.state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'when login successfully',
      setUp: () {
        when(() => _mockAuthUsecase.loginUsecase(username: inputEmail, password: inputPassword))
            .thenAnswer((_) async {});

        when(() => _navigator.replace(const AppRouteInfo.main()))
            .thenAnswer((_) => Future.value(true));
      },
      build: () => bloc,
      act: (bloc) {
        bloc
          ..add(const EmailTextFieldChanged(email: inputEmail))
          ..add(const PasswordTextFieldChanged(password: inputPassword))
          ..add(const LoginButtonPressed());
      },
      expect: () => <LoginState>[
        const LoginState(email: inputEmail),
        const LoginState(email: inputEmail, password: inputPassword, isLoginButtonEnabled: true),
      ],
      wait: Constants.defaultEventTransfomDuration,
      verify: (_) {
        verify(() => _navigator.replace(const AppRouteInfo.main())).called(1);
      },
    );

    tearDown(() {
      bloc.close();
    });

    blocTest<LoginBloc, LoginState>(
      'when login failed',
      setUp: () {
        when(() => _mockAuthUsecase.loginUsecase(username: inputEmail, password: inputPassword))
            .thenThrow(validationError);
      },
      build: () => bloc,
      act: (bloc) {
        bloc
          ..add(const EmailTextFieldChanged(email: inputEmail))
          ..add(const PasswordTextFieldChanged(password: inputPassword))
          ..add(const LoginButtonPressed());
      },
      expect: () => <LoginState>[
        const LoginState(email: inputEmail),
        const LoginState(email: inputEmail, password: inputPassword, isLoginButtonEnabled: true),
        LoginState(
          email: inputEmail,
          password: inputPassword,
          isLoginButtonEnabled: true,
          onPageError: validationError.message,
        ),
      ],
      verify: (_) {
        verifyNever(() => _navigator.replace(const AppRouteInfo.main()));
      },
    );

    tearDown(() {
      bloc.close();
    });
  });
}

const inputEmail = 'email';
const inputPassword = 'password';
const validationError = ValidationException(ValidationExceptionKind.invalidEmail);
