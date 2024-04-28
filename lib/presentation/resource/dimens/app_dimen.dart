import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/shared.dart';
import '../../presentation.dart';

class AppDimen {
  AppDimen._({
    required this.screenWidth,
    required this.screenHeight,
    required this.devicePixelRatio,
    required this.screenType,
  });

  static late AppDimen current;

  final double screenWidth;
  final double screenHeight;
  final double devicePixelRatio;
  final ScreenType screenType;

  static AppDimen of(BuildContext context) {
    final screenWidth = context.wDevice;
    final screenHeight = context.hDevice;
    final devicePixelRatio = context.devicePixelRatio;

    final screen = AppDimen._(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      devicePixelRatio: devicePixelRatio,
      screenType: _getScreenType(screenWidth),
    );

    current = screen;

    return current;
  }

  double responsiveDimens({required double mobile, double? tablet, double? ultraTablet}) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile.w;
      case ScreenType.tablet:
        return tablet?.w ?? ((mobile * Constants.maxMobileWidth) / Constants.designDeviceWidth);
      case ScreenType.ultraTablet:
        return ultraTablet?.w ??
            ((mobile * Constants.maxMobileWidth) / Constants.designDeviceWidth);
    }
  }

  // int responsiveIntValue({required int mobile, int? tablet, int? ultraTablet}) {
  //   switch (screenType) {
  //     case ScreenType.mobile:
  //       return mobile;
  //     case ScreenType.tablet:
  //       return tablet ?? mobile;
  //     case ScreenType.ultraTablet:
  //       return ultraTablet ?? mobile;
  //   }
  // }

  static ScreenType _getScreenType(double screenWidth) {
    if (screenWidth <= Constants.maxMobileWidth) {
      return ScreenType.mobile;
    } else if (screenWidth <= Constants.maxTabletWidth) {
      return ScreenType.tablet;
    } else {
      return ScreenType.ultraTablet;
    }
  }
}

extension ResponsiveDoubleExtension on num {
  double responsive({double? tablet, double? ultraTablet}) {
    return AppDimen.current.responsiveDimens(
      mobile: toDouble(),
      tablet: tablet,
      ultraTablet: ultraTablet,
    );
  }

  double get rps {
    return responsive();
  }
}

enum ScreenType {
  mobile,
  tablet,
  ultraTablet,
}
