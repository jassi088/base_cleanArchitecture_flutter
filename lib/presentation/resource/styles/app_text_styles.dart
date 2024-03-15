import 'package:flutter/material.dart';

import '../../presentation.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyles {
  AppTextStyles._();
  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

  static TextStyle s14w400Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 14.rps,
        fontWeight: FontWeight.w400,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s14w400Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 14.rps,
        fontWeight: FontWeight.w400,
        color: AppColors.current.secondaryTextColor,
      ));
}
