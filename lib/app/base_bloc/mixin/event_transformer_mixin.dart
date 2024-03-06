import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../shared/shared.dart';
import '../../app.dart';

mixin EventTransformerMixin<E extends BaseBlocEvent, S extends BaseBlocState>
    on BaseBlocDelegate<E, S> {
  String get name => runtimeType.toString();

  /// log event action with payload
  EventTransformer<Event> log<Event>() {
    return (events, mapper) => events.log(name, logOnData: true).flatMap(mapper);
  }

  /// ignores subsequent events for a duration, then repeats this process
  /// Giữ lại sự kiện đầu tiên và loại bỏ những sự kiện tiếp theo trong khoảng thời gian duration.
  EventTransformer<Event> throttleTime<Event>({
    Duration duration = Constants.defaultEventTransfomDuration,
  }) {
    return (events, mapper) =>
        events.throttleTime(duration).log(name, logOnData: true).flatMap(mapper);
  }

  /// skips data events if they are equal to the previous data event.
  /// Sử dụng hàm distinct() chỉ chấp nhận sự kiện mới nếu nó khác với sự kiện trước đó.
  EventTransformer<Event> distinct<Event>() {
    return (events, mapper) => events.distinct().log(name, logOnData: true).flatMap(mapper);
  }

  /// Only emit events from the source sequence whenever the time span defined by [duration] passes, without the source sequence emitting another item.
  /// This time span start after the last debounced event was emitted.
  /// Sử dụng hàm debounceTime() để chờ đợi khoảng thời gian duration trước khi chấp nhận sự kiện cuối cùng.
  EventTransformer<Event> debounceTime<Event>({
    Duration duration = Constants.defaultEventTransfomDuration,
  }) {
    return (events, mapper) =>
        events.debounceTime(duration).log(name, logOnData: true).flatMap(mapper);
  }

  /// ignore later events:
  /// The new events will be ignored until the previous process completes.
  /// Sử dụng hàm exhaustMap() để chỉ chấp nhận sự kiện mới nếu quá trình xử lý sự kiện trước đó đã hoàn thành.
  EventTransformer<Event> exhaustMap<Event>() {
    return (events, mapper) => events.log(name, logOnData: true).exhaustMap(mapper);
  }

  /// ignore previous events:
  /// The old events will be ignored when the new event was emitted.
  ///  Sử dụng hàm switchMap() để chấp nhận sự kiện mới ngay lập tức và bỏ qua sự kiện trước đó.
  EventTransformer<Event> switchMap<Event>() {
    return (events, mapper) => events.log(name, logOnData: true).switchMap(mapper);
  }

  /// concat events:
  /// The new events will be wait until the previous process completes
  ///  Sử dụng hàm asyncExpand() để chấp nhận và xử lý sự kiện mới ngay lập tức.
  EventTransformer<Event> asyncExpand<Event>() {
    return (events, mapper) => events.log(name, logOnData: true).asyncExpand(mapper);
  }

  /// both [distinct] and [exhaustMap]
  /// Kết hợp tính năng loại bỏ các sự kiện trùng lặp và loại bỏ sự kiện mới nếu sự kiện trước đó chưa hoàn thành.
  EventTransformer<Event> distinctExhaustMap<Event>() {
    return (events, mapper) => events.distinct().log(name, logOnData: true).exhaustMap(mapper);
  }

  /// both [distinct] and [switchMap]
  /// Kết hợp cả tính năng loại bỏ các sự kiện trùng lặp và chuyển đổi ngay lập tức sang sự kiện mới.
  EventTransformer<Event> distinctSwitchMap<Event>() {
    return (events, mapper) => events.distinct().log(name, logOnData: true).switchMap(mapper);
  }

  /// both [distinct] and [asyncExpand]
  /// Kết hợp cả tính năng loại bỏ các sự kiện trùng lặp và chấp nhận sự kiện mới ngay lập tức.
  EventTransformer<Event> distinctAsyncExpand<Event>() {
    return (events, mapper) => events.distinct().asyncExpand(mapper);
  }
}
