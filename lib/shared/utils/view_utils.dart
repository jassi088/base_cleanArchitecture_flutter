import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared.dart';

class ViewUtils {
  const ViewUtils._();

  static void showAppSnackBar(
    BuildContext context,
    String message, {
    Duration? duration,
    Color? backgroundColor,
  }) {
    final messengerState = ScaffoldMessenger.maybeOf(context);
    if (messengerState == null) {
      return;
    }
    messengerState.hideCurrentSnackBar();
    messengerState.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? Constants.defaultSnackBarDuration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  /// set status bar color & navigation bar color
  static void setSystemUIOverlayStyle(SystemUiOverlayStyle systemUiOverlayStyle) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  static Offset? getWidgetPosition(GlobalKey globalKey) {
    final renderObject = globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderObject != null ? renderObject.localToGlobal(Offset.zero) : null;
  }

  static double? getWidgetWidth(GlobalKey globalKey) {
    final renderObject = globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderObject != null ? renderObject.size.width : null;
  }

  static double? getWidgetHeight(GlobalKey globalKey) {
    final renderObject = globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderObject != null ? renderObject.size.height : null;
  }
}
