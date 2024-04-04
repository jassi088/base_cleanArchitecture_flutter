import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/app.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';

@Injectable()
class SettingBloc extends BaseBloc<SettingEvent, SettingState> {
  SettingBloc(this._appUsecase) : super(const SettingState()) {
    on<LogoutButtonPressed>(_onLogoutButtonPressed, transformer: log());
  }

  final AppUsecase _appUsecase;

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<SettingState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _appUsecase.logoutUseCase(const LoginRoute());
      },
    );
  }
}
