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
        return _buildAndroidDialog(context);
      case PopupType.ios:
        return _buildIosDialog(context);
      case PopupType.adaptive:
        return kIsWeb
            ? _buildAndroidDialog(context)
            : Platform.isIOS
                ? _buildIosDialog(context)
                : _buildAndroidDialog(context);
    }
  }

  Widget _buildAndroidDialog(BuildContext context) {
    return AlertDialog(
      actions: actions
          .map((e) => TextButton(
                onPressed: e.onPressed,
                child: Text(
                  e.text ?? 'OK',
                  style: e.isDefault
                      ? context.textTheme.labelMedium!
                          .copyWith(color: context.theme.colorScheme.primary)
                      : context.textTheme.labelMedium,
                ),
              ))
          .toList(growable: false),
      title: title != null ? Text(title ?? '', style: context.textTheme.labelMedium) : null,
      content: message != null ? Text(message ?? '', style: context.textTheme.labelMedium) : null,
    );
  }

  Widget _buildIosDialog(BuildContext context) {
    return CupertinoAlertDialog(
      actions: actions
          .map((e) => CupertinoDialogAction(
                onPressed: e.onPressed,
                child: Text(
                  e.text ?? 'OK',
                  style: e.isDefault
                      ? context.textTheme.labelMedium!
                          .copyWith(color: context.theme.colorScheme.primary)
                      : context.textTheme.labelMedium,
                ),
              ))
          .toList(growable: false),
      title: title != null ? Text(title ?? '', style: context.textTheme.labelMedium) : null,
      content: message != null ? Text(message ?? '', style: context.textTheme.labelMedium) : null,
    );
  }
}
