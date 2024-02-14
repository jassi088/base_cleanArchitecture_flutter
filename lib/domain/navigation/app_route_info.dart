import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
class AppRouteInfo<T> with _$AppRouteInfo {
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.itemDetail(T item) = _ItemDetail;
}
