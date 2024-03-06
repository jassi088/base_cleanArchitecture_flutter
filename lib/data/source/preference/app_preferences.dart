import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/domain.dart';
import '../../../shared/shared.dart';

@LazySingleton()
class AppPreferences {
  AppPreferences(this._sharedPreference)
      : _encryptedSharedPreferences = EncryptedSharedPreferences(prefs: _sharedPreference);

  final SharedPreferences _sharedPreference;
  final EncryptedSharedPreferences _encryptedSharedPreferences;

  bool get isDarkMode {
    return _sharedPreference.getBool(Constants.isDarkMode) ?? false;
  }

  bool get isFirstLogin => _sharedPreference.getBool(Constants.isFirstLogin) ?? true;

  // String get deviceToken {
  //   return _sharedPreference.getString(Constants.deviceToken) ?? '';
  // }

  // String get languageCode => _sharedPreference.getString(Constants.languageCode) ?? '';

  bool get isFirstLaunchApp => _sharedPreference.getBool(Constants.isFirstLaunchApp) ?? true;

  Future<String> get accessToken {
    return _encryptedSharedPreferences.getString(Constants.accessToken);
  }

  Future<String> get refreshToken {
    return _encryptedSharedPreferences.getString(Constants.refreshToken);
  }

  bool get isLoggedIn {
    final token = _sharedPreference.getString(Constants.accessToken) ?? '';

    return token.isNotEmpty;
  }

  User? get currentUser {
    final user = _sharedPreference.getString(Constants.currentUser);
    if (user == null) {
      return null;
    }

    return User.fromJson(json.decode(user));
  }

  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _sharedPreference.setBool(Constants.isFirstLogin, isFirstLogin);
  }

  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp) {
    return _sharedPreference.setBool(Constants.isFirstLaunchApp, isFirstLaunchApp);
  }

  Future<void> saveAccessToken(String token) async {
    await _encryptedSharedPreferences.setString(Constants.accessToken, token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _encryptedSharedPreferences.setString(Constants.refreshToken, token);
  }

  Future<bool> saveCurrentUser(User user) {
    return _sharedPreference.setString(Constants.currentUser, json.encode(user));
  }

  // Future<bool> saveDeviceToken(String token) {
  //   return _sharedPreference.setString(Constants.deviceToken, token);
  // }

  Future<void> clearCurrentUserData() async {
    await Future.wait([
      _sharedPreference.remove(Constants.currentUser),
      _sharedPreference.remove(Constants.accessToken),
      _sharedPreference.remove(Constants.refreshToken),
    ]);
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference.setBool(Constants.isDarkMode, isDarkMode);
  }

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(Constants.languageCode, languageCode);
  }
}
