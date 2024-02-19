import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../app.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      confirmDialog: (message, onPressed) {
        return CommonDialog(
          actions: [PopupButton(text: 'OK', onPressed: onPressed ?? () => navigator.pop())],
          message: message,
        );
      },
      errorWithRetryDialog: (message, onRetryPressed) {
        return CommonDialog(
          actions: [
            PopupButton(text: 'Cancel', onPressed: () => navigator.pop()),
            PopupButton(
                text: 'Retry', onPressed: onRetryPressed ?? () => navigator.pop(), isDefault: true),
          ],
          message: message,
        );
      },
    );
  }
}
