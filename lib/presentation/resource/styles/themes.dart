import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../presentation.dart';

part 'colors/light.dart';
part 'colors/dark.dart';
part 'theme_decoration.dart';
part 'theme_text.dart';
part 'theme_color.dart';

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  ThemeColor get themeColor => AppThemeSetting.getThemeColor();

  ThemeDecoration get themeDecoration => ThemeDecoration(this);

  String get fontFamily => FontFamily.notoSansJP;

  ThemeData getTheme(Brightness theme) {
    final dataThemeColor = themeColor;
    final themeText = ThemeText(fontFamily, themeColor: dataThemeColor);
    final newTextTheme = themeText.getTextTheme;

    return ThemeData(
      brightness: theme,
      splashColor: Colors.transparent,
      fontFamily: fontFamily,
      textTheme: newTextTheme,
      primaryTextTheme: newTextTheme,
      primaryColor: dataThemeColor.primaryColor,
      colorScheme: colorScheme.copyWith(
        brightness: theme,
        primary: dataThemeColor.primaryColor,
        secondary: dataThemeColor.secondaryColor,
        background: dataThemeColor.background,
        onSurface: dataThemeColor.textColor,
        surface: dataThemeColor.background,
        error: dataThemeColor.error,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: dataThemeColor.snackBarBackground,
        contentTextStyle: newTextTheme.labelMedium!.copyWith(color: dataThemeColor.snackBarContent),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(dataThemeColor.switchTrack),
        thumbColor: MaterialStateProperty.all(dataThemeColor.switchThumb),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.purple),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.purple),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size.fromHeight(45),
          // padding: EdgeInsets.zero,
          // elevation: 0,
          backgroundColor: dataThemeColor.backgroundButtonColor,
          // disabledForegroundColor: AppColors2.white,
          // disabledBackgroundColor: dataThemeColor.disableBackgroundColor,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        // filled: true,
        // fillColor: AppColors2.white,
        hintStyle: themeText.getTextTheme.labelMedium?.copyWith(color: themeColor.hintTextColor),
        // focusColor: dataThemeColor.scaffoldBackground,
        focusedBorder: themeDecoration.textInputBorder,
        // border: themeDecoration.textInputBorderNone,
        // enabledBorder: themeDecoration.textInputBorder,
        // focusedErrorBorder: themeDecoration.textInputErrorBorder,
        // errorBorder: themeDecoration.textInputErrorBorder,
      ),
      // tabBarTheme: TabBarTheme(
      //   indicator: const UnderlineTabIndicator(
      //     borderSide: BorderSide(color: AppColors2.white, width: 2),
      //   ),
      //   indicatorSize: TabBarIndicatorSize.tab,
      //   labelColor: AppColors2.white,
      //   unselectedLabelColor: AppColors2.white,
      //   labelStyle: themeText.tabBarThemeLabelStyle,
      //   unselectedLabelStyle: themeText.tabBarThemeUnselectedLabelStyle,
      // ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   backgroundColor: Colors.transparent,
      //   unselectedItemColor: const Color(0xFF8f8f8f),
      //   selectedItemColor: themeColor.primaryColor,
      //   selectedLabelStyle: TextStyle(
      //     fontSize: 12,
      //     fontWeight: FontWeight.w500,
      //     color: themeColor.primaryColor,
      //   ),
      //   unselectedLabelStyle: const TextStyle(
      //     fontSize: 12,
      //     fontWeight: FontWeight.w500,
      //     color: AppColors2.grey14,
      //   ),
      //   selectedIconTheme: IconThemeData(color: themeColor.primaryColor),
      //   unselectedIconTheme: const IconThemeData(color: AppColors2.grey14),
      //   type: BottomNavigationBarType.fixed,
      // ),

      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateProperty.all<Color>(dataThemeColor.textColor),
      //     textStyle: MaterialStateProperty.all<TextStyle>(themeText.textButtonThemeStyle),
      //   ),
      // ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //       side: BorderSide(color: themeColor.primaryColor),
      //     ),
      //     foregroundColor: themeColor.outlinedButtonPrimary,
      //     padding: EdgeInsets.zero,
      //     minimumSize: const Size.fromHeight(45),
      //   ),
      // ),

      // appBarTheme: AppBarTheme(
      //   backgroundColor: dataThemeColor.scaffoldBackground,
      //   titleTextStyle: themeText.textTitleAppbarThemeStyle,
      //   toolbarHeight: 48,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   shape: const Border(bottom: BorderSide(color: Color(0xFFF0F2F4))),
      // ),
      // bottomSheetTheme: BottomSheetThemeData(
      //   backgroundColor: dataThemeColor.background,
      //   elevation: 0,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //   ),
      // ),
    );
  }
}

class AppThemeSetting {
  const AppThemeSetting._();
  static late AppThemeType currentAppThemeType = AppThemeType.light;

  static ThemeColor getThemeColor() {
    return currentAppThemeType == AppThemeType.light ? ThemeColorLight() : ThemeColorDark();
  }
}
