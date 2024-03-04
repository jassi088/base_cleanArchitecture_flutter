import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';
import '../../../../shared/shared.dart';

part 'noti_state.freezed.dart';

@freezed
class NotiState extends BaseBlocState with _$NotiState {
  factory NotiState({
    @Default(LoadMoreOutput<Msg>(data: <Msg>[])) LoadMoreOutput<Msg> notifications,
    @Default(false) bool isShimmerLoading,
    AppException? loadNotiException,
  }) = _NotiState;
}
