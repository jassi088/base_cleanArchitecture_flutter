import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/app.dart';

part 'main_state.freezed.dart';

@freezed
class MainState extends BaseBlocState with _$MainState {
  const factory MainState({
    @Default('') String id,
  }) = _MainState;
}
