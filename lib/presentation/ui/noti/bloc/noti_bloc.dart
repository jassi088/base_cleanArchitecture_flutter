import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';
import 'noti.dart';

@Injectable()
class NotiBloc extends BaseBloc<NotiEvent, NotiState> {
  NotiBloc(this._notiUsecase) : super(NotiState()) {
    on<NotiPageInitiated>(_onNotiPageInitiated, transformer: log());

    on<NotiLoadMore>(_onNotiLoadMore, transformer: log());

    on<NotiPageRefreshed>(_onNotiPageRefreshed, transformer: log());
  }
  final NotiUsecase _notiUsecase;

  FutureOr<void> _onNotiPageInitiated(NotiPageInitiated event, Emitter<NotiState> emit) async {
    await _getNotification(
      emit: emit,
      isInitialLoad: true,
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isShimmerLoading: false)),
    );
  }

  FutureOr<void> _onNotiLoadMore(NotiLoadMore event, Emitter<NotiState> emit) async {
    await _getNotification(emit: emit, isInitialLoad: false);
  }

  FutureOr<void> _onNotiPageRefreshed(NotiPageRefreshed event, Emitter<NotiState> emit) async {
    await _getNotification(
      emit: emit,
      isInitialLoad: true,
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async {
        emit(state.copyWith(isShimmerLoading: false));

        if (!event.completer.isCompleted) {
          event.completer.complete();
        }
      },
    );
  }

  Future<void> _getNotification({
    required Emitter<NotiState> emit,
    required bool isInitialLoad,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      action: () async {
        final output = await _notiUsecase.execute(isInitialLoad: isInitialLoad);
        emit(state.copyWith(notifications: output));
      },
      doOnError: (e) async {
        emit(state.copyWith(loadNotiException: e));
      },
      doOnSubscribe: doOnSubscribe,
      doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
    );
  }
}
