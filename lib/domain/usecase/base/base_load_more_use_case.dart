import 'package:flutter/foundation.dart';

import '../../../shared/shared.dart';
import '../../domain.dart';

abstract class BaseUseCase<Output> with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase();
}

abstract class BaseLoadMoreUseCase<T> extends BaseUseCase<Future<PagedList<T>>> {
  BaseLoadMoreUseCase({
    this.initPage = PagingConstants.initialPage,
    this.initOffset = 0,
  })  : _output = LoadMoreOutput<T>(data: <T>[], page: initPage, offset: initOffset),
        _oldOutput = LoadMoreOutput<T>(data: <T>[], page: initPage, offset: initOffset);

  final int initPage;
  final int initOffset;

  LoadMoreOutput<T> _output;
  LoadMoreOutput<T> _oldOutput;

  int get page => _output.page;
  int get offset => _output.offset;

  Future<LoadMoreOutput<T>> execute(bool isInitialLoad) async {
    try {
      if (isInitialLoad) {
        _output = LoadMoreOutput<T>(data: <T>[], page: initPage, offset: initOffset);
      }
      if (LogConfig.enableLogUseCaseInput) {
        logD('LoadMoreUseCase Page: $page, offset: $offset');
      }
      final pagedList = await buildUseCase();

      final newOutput = _oldOutput.copyWith(
        data: pagedList.data,
        otherData: pagedList.otherData,
        page: isInitialLoad
            ? initPage + (pagedList.data.isNotEmpty ? 1 : 0)
            : _oldOutput.page + (pagedList.data.isNotEmpty ? 1 : 0),
        offset: isInitialLoad
            ? (initOffset + pagedList.data.length)
            : _oldOutput.offset + pagedList.data.length,
        isLastPage: pagedList.isLastPage,
        isRefreshSuccess: isInitialLoad,
      );

      _output = newOutput;
      _oldOutput = newOutput;
      if (LogConfig.enableLogUseCaseOutput) {
        logD(
          'LoadMoreUseCase Output: pagedList: $pagedList, inputPage: $page, inputOffset: $offset, newOutput: $newOutput',
        );
      }

      return newOutput;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logE('FutureUseCase Error: $e');
      }
      _output = _oldOutput;

      throw Exception(e.toString());
    }
  }
}
