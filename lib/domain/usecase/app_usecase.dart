import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@Injectable()
class AppUsecase {
  final AppRepository _appRepository;
  final AppNavigator _navigator;

  AppUsecase(this._appRepository, this._navigator);

  // bool get getInitialHomeDataUseCase =>
  //     !_appRepository.isLoggedIn && _appRepository.isFirstLaunchApp;

  bool get isLoggedInUseCase => _appRepository.isLoggedIn;

  bool get isDarkModeUseCase => _appRepository.isDarkMode;

  List<InitialAppRoute> get loadInitialResourceUseCase =>
      [_appRepository.isLoggedIn ? InitialAppRoute.main : InitialAppRoute.login];

  Future<bool> saveIsDarkModeUseCase({required bool isDarkMode}) async {
    return await _appRepository.saveIsDarkMode(isDarkMode);
  }

  Future<bool> saveIsFirstLaunchAppUseCase({required bool isFirstLaunchApp}) async {
    return await _appRepository.saveIsFirstLaunchApp(isFirstLaunchApp);
  }

  Future<bool> saveIsFirstLoginUseCase({required bool isFirstLogin}) async {
    return await _appRepository.saveIsFirstLogin(isFirstLogin);
  }

  Future<void> clearCurrentUserDataUseCase() async {
    await _appRepository.clearCurrentUserData();
  }

  Future<void> logoutUseCase(PageRouteInfo loginRoute) async {
    if (_appRepository.isLoggedIn) {
      await _navigator.showDialog(
        AppPopupInfo.confirmDialog(
          message: 'Bạn có chắc muốn đăng xuất',
          onPressed: () async {
            await _appRepository.clearCurrentUserData();
            await _navigator.replaceAll([loginRoute]);
            //return await _repository.logout();
          },
        ),
        useRootNavigator: true,
      );
    }
  }
}
