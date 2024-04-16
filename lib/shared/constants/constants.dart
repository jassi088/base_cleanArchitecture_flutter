class Constants {
  const Constants._();

  //Header
  static const basicAuthorization = 'Authorization';
  static const jwtAuthorization = 'JWT-Authorization';
  static const userAgentKey = 'User-Agent';
  static const bearer = 'Bearer';

  // API config
  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);
  static int maxRetries = 3;
  static Duration retryInterval = const Duration(seconds: 3);

  // Firebase
  // static const myCollection = 'myCollection';

  // Device
  static const designDeviceWidth = 375.0;
  static const designDeviceHeight = 667.0;

  static const maxMobileWidth = 450;
  static const maxTabletWidth = 900;

  static const maxMobileWidthForDeviceType = 550;

  // Paging
  static const initialPage = 1;
  static const itemsPerPage = 30;
  static const defaultInvisibleItemsThreshold = 3;

  // SharedPreferenceKeys
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const currentUser = 'currentUser';
  static const isDarkMode = 'isDarkMode';
  static const deviceToken = 'deviceToken';
  static const isFirstLogin = 'isFirstLogin';
  static const isFirstLaunchApp = 'isFirstLaunchApp';
  static const languageCode = 'languageCode';

  // Duration
  static const defaultListGridTransitionDuration = Duration(milliseconds: 500);
  static const defaultEventTransfomDuration = Duration(milliseconds: 500);
  static const defaultGeneralDialogTransitionDuration = Duration(milliseconds: 200);
  static const defaultSnackBarDuration = Duration(seconds: 3);
  static const defaultErrorVisibleDuration = Duration(seconds: 3);
  static const defaultSuccessVisibleDuration = Duration(seconds: 1);

  // DateTime Format
  static const uiDateDmy = 'dd/MM/yyyy';
  static const uiTimeHm = 'HH:mm';
  static const uiDateTime = 'dd/MM/yyyy HH:mm';

  static const appServerRequest = 'yyyy-MM-dd';

  static const String? appServerResponse = null; // null <=> Iso8601
  static const String defaultFormat = '#,###';

  // Locale && Respone
  static const en = 'en';
  static const ja = 'ja';
  static const defaultLocale = 'en';
  static const male = 0;
  static const female = 1;
  static const other = 2;
  static const unknown = -1;
}
