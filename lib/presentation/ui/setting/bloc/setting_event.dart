import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/app.dart';

part 'setting_event.freezed.dart';

abstract class SettingEvent extends BaseBlocEvent {
  const SettingEvent();
}

@freezed
class SettingInitiated extends SettingEvent with _$SettingInitiated {
  const factory SettingInitiated({
    required int id,
  }) = _SettingInitiated;
}

@freezed
class LogoutButtonPressed extends SettingEvent with _$LogoutButtonPressed {
  const factory LogoutButtonPressed() = _LogoutButtonPressed;
}
