import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@Injectable(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppPreferences _appPreferences;

  AppRepositoryImpl(this._appPreferences);

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;

  @override
  Stream<bool> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged.map((event) => event != ConnectivityResult.none);

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<User> getMe() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // await _appApiService.logout();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> saveAccessToken(String accessToken) => _appPreferences.saveAccessToken(accessToken);

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<bool> saveUserPreference(User user) => _appPreferences.saveCurrentUser(user);

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();
}
