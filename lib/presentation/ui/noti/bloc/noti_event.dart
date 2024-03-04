import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../app/app.dart';

part 'noti_event.freezed.dart';

abstract class NotiEvent extends BaseBlocEvent {
  const NotiEvent();
}

@freezed
class NotiPageInitiated extends NotiEvent with _$NotiPageInitiated {
  const factory NotiPageInitiated() = _NotiPageInitiated;
}

@freezed
class NotiPageRefreshed extends NotiEvent with _$NotiPageRefreshed {
  const factory NotiPageRefreshed({required Completer<void> completer}) = _NotiPageRefreshed;
}

@freezed
class NotiLoadMore extends NotiEvent with _$NotiLoadMore {
  const factory NotiLoadMore() = _NotiLoadMore;
}
