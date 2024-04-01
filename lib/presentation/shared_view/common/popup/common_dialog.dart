import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../presentation.dart';

enum PopupType { android, ios, adaptive }

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    this.commonPopupType = PopupType.adaptive,
    this.actions = const <PopupButton>[],
    this.title,
    this.message,
    super.key,
  });

  final PopupType commonPopupType;
  final List<PopupButton> actions;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    switch (commonPopupType) {
      case PopupType.android:
        return _buildAndroidDialog();
      case PopupType.ios:
        return _buildIosDialog();
      case PopupType.adaptive:
        return kIsWeb
            ? _buildAndroidDialog()
            : Platform.isIOS
                ? _buildIosDialog()
                : _buildAndroidDialog();
    }
  }

  Widget _buildAndroidDialog() {
    return AlertDialog(
      actions: actions
          .map((e) => TextButton(
                onPressed: e.onPressed,
                child: Text(
                  e.text ?? 'OK',
                  style: e.isDefault
                      ? AppTextStyles.s14w400Secondary()
                      : AppTextStyles.s14w400Primary(),
                ),
              ))
          .toList(growable: false),
      title: title != null ? Text(title ?? '', style: AppTextStyles.s14w400Primary()) : null,
      content: message != null ? Text(message ?? '', style: AppTextStyles.s14w400Primary()) : null,
    );
  }

  Widget _buildIosDialog() {
    return CupertinoAlertDialog(
      actions: actions
          .map((e) => CupertinoDialogAction(
                onPressed: e.onPressed,
                child: Text(
                  e.text ?? 'OK',
                  style: e.isDefault
                      ? AppTextStyles.s14w400Secondary()
                      : AppTextStyles.s14w400Primary(),
                ),
              ))
          .toList(growable: false),
      title: title != null ? Text(title ?? '', style: AppTextStyles.s14w400Primary()) : null,
      content: message != null ? Text(message ?? '', style: AppTextStyles.s14w400Primary()) : null,
    );
  }
}
