import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../app.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc(this._appUsecase) : super(const AppState()) {
    on<IsLoggedInStatusChanged>(_onIsLoggedInStatusChanged, transformer: log());
    on<AppThemeChanged>(_onAppThemeChanged, transformer: throttleTime());
    // on<AppLanguageChanged>(_onAppLanguageChanged, transformer: log());
    on<AppInitiated>(_onAppInitiated, transformer: log());
    on<AppLogoutPressed>(_onAppLogoutPressed, transformer: log());
  }

  final AppUsecase _appUsecase;

  void _onIsLoggedInStatusChanged(IsLoggedInStatusChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(isLoggedIn: event.isLoggedIn));
  }

  Future<void> _onAppThemeChanged(AppThemeChanged event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        await _appUsecase.saveIsDarkModeUseCase(isDarkMode: event.isDarkTheme);
        _updateThemeSetting(event.isDarkTheme);
        emit(state.copyWith(isDarkTheme: event.isDarkTheme));
      },
    );
  }

  // Future<void> _onAppLanguageChanged(AppLanguageChanged event, Emitter<AppState> emit) async {
  //   await runBlocCatching(
  //     action: () async {
  //       await _saveLanguageCodeUseCase
  //           .execute(SaveLanguageCodeInput(languageCode: event.languageCode));
  //       emit(state.copyWith(languageCode: event.languageCode));
  //     },
  //   );
  // }

  Future<void> _onAppInitiated(AppInitiated event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        // final output = _getInitialAppDataUseCase.execute(const GetInitialAppDataInput());
        final output = _appUsecase.getInitialAppDataUseCase;
        _updateThemeSetting(output);
        emit(state.copyWith(
          isDarkTheme: output,
          isLoggedIn: output,
          // languageCode: output.languageCode,
        ));
      },
    );
  }

  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType = isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }

  FutureOr<void> _onAppLogoutPressed(AppLogoutPressed event, Emitter<AppState> emit) {
    return runBlocCatching(
      action: () async {
        await _appUsecase.logoutUseCase();
        await navigator.replace(const AppRouteInfo.login());
      },
    );
  }
}
