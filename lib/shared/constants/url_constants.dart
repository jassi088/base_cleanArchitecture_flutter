import '../shared.dart';

class UrlConstants {
  const UrlConstants._();

  /// Url
  // static const termUrl = 'https://www.chatwork.com/';
  // static const lineApiBaseUrl = 'https://api.line.me/';
  // static const twitterApiBaseUrl = 'https://api.twitter.com/';
  // static const goongApiBaseUrl = 'https://rsapi.goong.io/';
  // static const firebaseStorageBaseUrl = 'https://firebasestorage.googleapis.com/';

  // static const mockApiBaseUrl = 'https://api.jsonbin.io/';

  /// Path
  // static const remoteConfigPath = '/config/RemoteConfig.json';
  // static const settingsPath = '/mypage/settings';

  static String get appApiBaseUrl {
    switch (EnvConstants.flavor) {
      case Flavor.develop:
        return 'https://sos-backend.smartlook.com.vn:50003/';
      case Flavor.qa:
        return 'https://sos-backend.smartlook.com.vn:50003/';
      case Flavor.staging:
        return 'https://sos-backend.smartlook.com.vn:50003/';
      case Flavor.production:
        return 'https://sos-backend.smartlook.com.vn:50003/';
    }
  }
}
