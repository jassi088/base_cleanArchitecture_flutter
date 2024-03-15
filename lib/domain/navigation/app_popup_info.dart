import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_popup_info.freezed.dart';

/// dialog, bottomsheet
@freezed
class AppPopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    @Default('') String message,
    Function()? onPressed,
    Function()? onCancel,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.errorWithRetryDialog({
    @Default('') String message,
    Function()? onRetryPressed,
    Function()? onCancel,
  }) = _ErrorWithRetryDialog;
}
