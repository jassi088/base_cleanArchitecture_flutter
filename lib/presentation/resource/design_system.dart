import 'package:flutter/material.dart';

extension Ctx on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  // Size
  Size get size => MediaQuery.of(this).size;

  double get wDevice => MediaQuery.sizeOf(this).width;
  double get hDevice => MediaQuery.sizeOf(this).height;
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  double get padBottom => MediaQuery.paddingOf(this).bottom;
  double get padTop => MediaQuery.paddingOf(this).top;
}
