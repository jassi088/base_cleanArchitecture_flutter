part of 'themes.dart';

class ThemeText {
  final ThemeColor themeColor;
  final String fontFamily;

  late TextTheme _textTheme;

  ThemeText(this.fontFamily, {required this.themeColor}) {
    _textTheme = TextTheme(
      //headling 1
      displayLarge: ts(fontSize: 32.rps, fontWeight: FontWeight.normal),

      //headling 2
      displayMedium: ts(fontSize: 28.rps, fontWeight: FontWeight.normal),

      //headling 3
      displaySmall: ts(fontSize: 24.rps, fontWeight: FontWeight.normal),

      //headling 4
      headlineLarge: ts(fontSize: 20.rps, fontWeight: FontWeight.w600),

      //headling 5
      headlineMedium: ts(fontSize: 18.rps, fontWeight: FontWeight.w500),

      //headling 6
      headlineSmall: ts(fontSize: 14.rps, fontWeight: FontWeight.w600),

      //Paragraphh: Text normal in app
      bodyMedium: ts(fontSize: 16.rps, fontWeight: FontWeight.w400),

      //Small text: TimeAgo - Share
      bodySmall: ts(fontSize: 12.rps, fontWeight: FontWeight.w500),

      //Paragraph Exxtend
      labelMedium: ts(fontSize: 14.rps, fontWeight: FontWeight.w400),

      /// Text in Button
      labelLarge: ts(fontSize: 18.rps, fontWeight: FontWeight.w600),

      /// Text in AppBar
      titleLarge: ts(fontSize: 20.rps, fontWeight: FontWeight.w600),

      titleSmall: ts(fontSize: 16.rps, fontWeight: FontWeight.w600),

      bodyLarge: ts(fontSize: 15.rps, fontWeight: FontWeight.w900),

      /// Text in TextField, Title of LisTile
      titleMedium: ts(fontSize: 15.rps, fontWeight: FontWeight.w400),
    );
  }

  TextTheme get getTextTheme => _textTheme;
  TextStyle get paragraph => _textTheme.bodyMedium!;
  TextStyle get paragraphExt => _textTheme.labelMedium!;
  TextStyle get smallText => _textTheme.bodySmall!;

  TextStyle get textButtonThemeStyle => _textTheme.labelLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 16.rps,
      ));

  TextStyle get textTitleAppbarThemeStyle => _textTheme.labelLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 16.rps,
      ));

  TextStyle get tabBarThemeLabelStyle => _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.rps,
        fontWeight: FontWeight.w600,
      ));

  TextStyle get tabBarThemeUnselectedLabelStyle => _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.rps,
        fontWeight: FontWeight.w400,
      ));

  //-----------------------------------------------------------
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

  TextStyle ts({
    required double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return _baseTextStyle.merge(
      TextStyle(
        fontFamily: fontFamily ?? this.fontFamily,
        color: themeColor.textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
