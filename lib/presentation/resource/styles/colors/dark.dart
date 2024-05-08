part of '../themes.dart';

class ThemeColorDark extends ThemeColor {
  @override
  Color get primaryColor => AppColors.black;
  @override
  Color get secondaryColor => AppColors.purple;
  @override
  Color get scaffoldBackground => AppColors.white;
  @override
  Color get background => Colors.black;

  // ---> Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => AppColors.black;
  @override
  Color get bottomBarIconUnSelected => const Color(0xFF9D9D9D);
  @override
  Color get bottomBarSelectedItemColor => AppColors.black;
  @override
  Color get bottomBarUnselectedItemColor => const Color(0xFF9D9D9D);

  // ---> AppBar
  @override
  Color get appbarTitleColor => const Color(0xFF1D1E2C);

  @override
  Color get error => AppColors.red10;
  @override
  Color get textInputBorderColor => AppColors.purple;
  @override
  Color get hintTextColor => AppColors.grey10;
  @override
  Color get disableBackgroundColor => AppColors.grey11;

  // ---> Button
  @override
  Color get textColor => AppColors.purple;
  @override
  Color get outlinedButtonPrimary => Colors.black;
  @override
  Color get backgroundButtonColor => AppColors.black10;

  // ---> Switch
  @override
  Color get switchTrack => AppColors.purple;
  @override
  Color get switchThumb => AppColors.white;

  // ---> SnackBar
  @override
  Color get snackBarBackground => AppColors.black;
  @override
  Color get snackBarContent => AppColors.purple;
}
