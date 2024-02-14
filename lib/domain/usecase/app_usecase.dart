import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class AppUsecase {
  final AppRepository _appRepository;
  final AppNavigator _navigator;

  AppUsecase(this._appRepository, this._navigator);

  bool get getInitialAppDataUseCase => !_appRepository.isDarkMode && !_appRepository.isLoggedIn;

  // bool get getInitialHomeDataUseCase =>
  //     !_appRepository.isLoggedIn && _appRepository.isFirstLaunchApp;

  bool get isLoggedInUseCase => !_appRepository.isLoggedIn;

  List<InitialAppRoute> get loadInitialResourceUseCase =>
      [_appRepository.isLoggedIn ? InitialAppRoute.main : InitialAppRoute.login];

  Future<bool> saveIsDarkModeUseCase(bool isDarkMode) async {
    return await _appRepository.saveIsDarkMode(isDarkMode);
  }

  Future<bool> saveIsFirstLaunchAppUseCase(bool isFirstLaunchApp) async {
    return await _appRepository.saveIsFirstLaunchApp(isFirstLaunchApp);
  }

  Future<bool> saveIsFirstLoginUseCase(bool isFirstLogin) async {
    return await _appRepository.saveIsFirstLogin(isFirstLogin);
  }

  Future<void> clearCurrentUserDataUseCase() async {
    return await _appRepository.clearCurrentUserData();
  }

  Future<void> logoutUseCase() async {
    if (_appRepository.isLoggedIn) {
      await _navigator.replace(const AppRouteInfo.login());
      //return await _repository.logout();
    }
  }
}
