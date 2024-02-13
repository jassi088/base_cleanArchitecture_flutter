import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/shared.dart';

part 'load_more.freezed.dart';

@freezed
class LoadMore<T> with _$LoadMore<T> {
  const LoadMore._();

  const factory LoadMore({
    required List<T> data,
    @Default(null) Object? otherData,
    @Default(PagingConstants.initialPage) int page,
    @Default(false) bool isRefreshSuccess,
    @Default(0) int offset,
    @Default(false) bool isLastPage,
  }) = _LoadMore;

  int get nextPage => page + 1;
  int get previousPage => page - 1;
}
