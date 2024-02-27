import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/app.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState extends BaseBlocState with _$SettingState {
  const SettingState._();

  const factory SettingState({
    @Default('') String id,
  }) = _SettingState;
}
