part of '../themes.dart';

class ThemeColorLight extends ThemeColor {
  @override
  Color get primaryColor => AppColors.purple;
  @override
  Color get secondaryColor => AppColors.black;
  @override
  Color get scaffoldBackground => AppColors.white;
  @override
  Color get background => AppColors.grey12;

  // ---> Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => AppColors.purple;
  @override
  Color get bottomBarIconUnSelected => const Color(0xFF9D9D9D);
  @override
  Color get bottomBarSelectedItemColor => AppColors.purple;
  @override
  Color get bottomBarUnselectedItemColor => const Color(0xFF9D9D9D);

  // ---> AppBar
  @override
  Color get appbarTitleColor => const Color(0xFF1D1E2C);

  @override
  Color get error => AppColors.red10;
  @override
  Color get disableBackgroundColor => AppColors.grey11;
  @override
  Color get textInputBorderColor => AppColors.grey10;
  @override
  Color get hintTextColor => AppColors.grey10;

  // ---> Button
  @override
  Color get textColor => AppColors.black;
  @override
  Color get outlinedButtonPrimary => Colors.black;
  @override
  Color get backgroundButtonColor => AppColors.white;

  // ---> Switch
  @override
  Color get switchTrack => AppColors.blue3;
  @override
  Color get switchThumb => AppColors.grey2;

  // ---> SnackBar
  @override
  Color get snackBarBackground => AppColors.black;
  @override
  Color get snackBarContent => AppColors.white;
}
