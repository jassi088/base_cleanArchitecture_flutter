part of 'themes.dart';

abstract class ThemeColor {
  Color get primaryColor;
  Color get secondaryColor;
  Color get scaffoldBackground;
  Color get background;

  // ---> BottomNavigationBar
  Color get bottomBarIconSelected;
  Color get bottomBarIconUnSelected;
  Color get bottomBarSelectedItemColor;
  Color get bottomBarUnselectedItemColor;

  // ---> AppBar
  Color get appbarTitleColor;

  Color get error;
  Color get disableBackgroundColor;
  Color get textInputBorderColor;
  Color get hintTextColor;

  // ---> Button
  Color get textColor;
  Color get outlinedButtonPrimary;
  Color get backgroundButtonColor;

  // ---> Switch
  Color get switchTrack;
  Color get switchThumb;

  // ---> SnackBar
  Color get snackBarBackground;
  Color get snackBarContent;
}

class AppColors {
  /// grey
  static const Color lightGrey = Color(0xFFE9F0F6);
  static const Color grey2 = Color(0xff696969);
  static const Color grey3 = Color(0xffEDEDED);
  static const Color grey4 = Color(0xffB6B6B6);
  static const Color grey5 = Color(0xffE0E0E0);
  static const Color grey6 = Color(0xffDADADA);
  static const Color grey7 = Color(0xffC8D3DE);
  static const Color grey8 = Color(0xff9EAED1);
  static const Color grey9 = Color(0xffDFDFDF);
  static const Color grey10 = Color(0xffA6AFCE);
  static const Color grey11 = Color(0xff9EAED1);
  static const Color grey12 = Color(0xffF5F5F5);
  static const Color grey13 = Color(0xffD1D1D1);
  static const Color grey14 = Color(0xffA1A1A1);
  static const Color grey15 = Color(0xffBDBDBD);
  static const Color grey20 = Color(0xff828282);
  static const Color grey30 = Color(0xff717171);
  static const Color grey40 = Color(0xff636363);
  static const Color grey50 = Color(0xff7B7676);
  static const Color grey69 = Color(0xffEFEFEF);
  static const Color grey70 = Color(0xffF2F2F2);
  static const Color grey71 = Color(0xffFAFAFA);
  static const Color grey72 = Color(0xff666666);
  static const Color grey73 = Color(0xff555555);
  static const Color grey74 = Color(0xff707070);
  static const Color greyTextColor = Color(0xff434343);
  static const Color greyLightTextColor = Color(0xff8C8C8C);
  static const Color greyBorder = Color(0xffE2E2E2);
  static const Color popupShadowColor = Color(0xff919EAB);
  static const Color grey75 = Color(0xff90A3BF);

  /// white
  static const Color white = Color(0xffffffff);

  /// black
  static const Color black10 = Color.fromARGB(255, 30, 30, 30);
  static const Color black11 = Color(0xff363636);
  static const Color black12 = Color(0xff383838);

  /// blue
  static const Color blue5 = Color(0xffF1F8FF);
  static const Color blue6 = Color(0xffECF5FE);
  static const Color blue7 = Color(0xffD4F0FF);
  static const Color blue8 = Color(0xff54D7FF);
  static const Color blue9 = Color(0xff2AC5F4);
  static const Color blue10 = Color(0xff1E90FF);
  static const Color blue11 = Color(0xff3C9DFC);
  static const Color blue12 = Color(0xffCEE1F2);
  static const Color blue13 = Color(0xffE1F0FF);
  static const Color blue14 = Color(0xff73DDFF);

  static const Color blue3 = Color(0xffEfFBFF);
  static const Color blue15 = Color(0xff287DB2);
  static const Color blue16 = Color(0xff2685AE);
  static const Color blue20 = Color(0xff0E88FF);
  static const Color blue25 = Color(0xff2F80ED);
  static const Color blue30 = Color(0xff005BB4);
  static const Color blue31 = Color(0xff0023C4);
  static const Color blue32 = Color(0xff5BA3E9);
  static const Color blue33 = Color(0xff458EF7);

  /// pink
  static const Color pink10 = Color(0xffFF7FD2);

  /// green
  static const Color green10 = Color(0xff20F943);
  static const Color green11 = Color(0xff03A300);
  static const Color green20 = Color(0xff5FD95C);
  static const Color green21 = Color(0xff74C973);

  /// red
  static const Color red1 = Color(0xffDA3E39);
  static const Color red2 = Color(0xffD92424);
  static const Color red3 = Color(0xffFF4D4F);
  static const Color red10 = Color(0xffD90000);
  static const Color red20 = Color(0xffE0230D);
  static const Color red30 = Color(0xffEB5757);
  static const Color red35 = Color(0xffDD636E);
  static const Color red36 = Color(0xffFF0000);
  static const Color red69 = Color(0xffEA5F5F);

  /// purple
  static const Color purple10 = Color(0xff403666);
  static const Color purple20 = Color(0xffA663B5);
  static const Color purple30 = Color(0xff571BFF);
  static const Color purple35 = Color(0xffF61AF4);
  static const Color purple50 = Color(0xFF3E0367);
  static const Color purple55 = Color(0xFFC872FF);

  /// organge
  static const Color organge1 = Color(0xffFFAD0D);

  static const Color purple = Color.fromARGB(255, 166, 168, 254);
  static const Color black = Color.fromARGB(255, 62, 62, 70);

  static const Color transparent = Colors.transparent;
  static final Color transparentWithOpacity10 = transparent.withOpacity(0.10);
  static const Color yellow = Color(0xffEEBE16);
  static const Color blue = Color(0xff3179E0);
  static const Color blueAccent = Color(0xff38BFF8);
  static const Color purpleAccent = Color(0xff74549A);
  static const Color orange = Color(0xffF38E22);
  static const Color orangeAccent = Color(0xffEEBC17);
  static const Color blueGrey = Color(0xff425774);
  static const Color blueGreyAccent = Color(0xff5F758B);
  static const Color blueGreyAccent2 = Color(0xff667C90);
  static const Color red = Color(0xffd90429);
  static const Color redAccent = Color(0xffFA5570);
  static const Color purple100 = Color(0xff9583FF);
  static const Color grey = Color(0xff70787D);
  static const Color grey500 = Colors.grey;

  static const List<Color> backgroundGradient = [
    purple100,
    blueAccent,
    yellow,
    yellow,
  ];
  static const List<Color> blueGradient = [
    blueAccent,
    blue,
  ];
  static const List<Color> blueGreyGradient = [
    blueGreyAccent2,
    blueGrey,
  ];
  static const List<Color> purpleGradient = [
    purpleAccent,
    purple,
  ];
  static const List<Color> orangeGradient = [
    orangeAccent,
    orange,
  ];
  static const List<Color> redGradient = [
    redAccent,
    red,
  ];

  //gradient Colors with opacity
  static final List<Color> blueGradientWithOpacity = [
    blueAccent.withOpacity(0.5),
    blue,
  ];
  static final List<Color> blueGreyGradientWithOpacity = [
    blueGreyAccent.withOpacity(0.5),
    blueGrey,
  ];
  static final List<Color> purpleGradientWithOpacity = [
    purpleAccent.withOpacity(0.5),
    purple,
  ];
  static final List<Color> orangeGradientWithOpacity = [
    orangeAccent.withOpacity(0.5),
    orange,
  ];
}
