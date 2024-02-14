import '../domain.dart';

abstract class AppRepository {
  bool get isLoggedIn;

  bool get isFirstLaunchApp;

  bool get isFirstLogin;

  bool get isDarkMode;

  // LanguageCode get languageCode;

  Stream<bool> get onConnectivityChanged;

  // User getUserPreference();

  Future<void> clearCurrentUserData();

  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp);

  Future<bool> saveIsDarkMode(bool isDarkMode);

  // Future<bool> saveLanguageCode(LanguageCode languageCode);

  Future<void> saveAccessToken(String accessToken);

  Future<bool> saveUserPreference(User user);

  Future<User> getMe();

  Future<void> logout();

  /// ----- Store objectbox(*Local database*) -----
  int putLocalUser(User user);

  Stream<List<User>> getLocalUsersStream();

  List<User> getLocalUsers();

  User? getLocalUser(int id);

  bool deleteImageUrl(int id);

  int deleteAllUsersAndImageUrls();
}
