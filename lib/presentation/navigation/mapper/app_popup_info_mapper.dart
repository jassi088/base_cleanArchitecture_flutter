import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      confirmDialog: (message, onPressed, onCancel) {
        return CommonDialog(
          actions: [
            PopupButton(text: 'OK', onPressed: onPressed ?? () => navigator.pop()),
            PopupButton(text: 'Cancel', onPressed: onCancel ?? () => navigator.pop()),
          ],
          message: message,
        );
      },
      errorWithRetryDialog: (message, onRetryPressed, onCancel) {
        return CommonDialog(
          actions: [
            PopupButton(
              text: 'Retry',
              onPressed: onRetryPressed ?? () => navigator.pop(),
              isDefault: true,
            ),
            PopupButton(text: 'Cancel', onPressed: onCancel ?? () => navigator.pop()),
          ],
          message: message,
        );
      },
    );
  }
}
