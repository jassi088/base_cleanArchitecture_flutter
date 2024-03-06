import 'dart:async';

import '../../shared.dart';

class AppExceptionWrapper {
  AppExceptionWrapper({required this.appException, this.exceptionCompleter, this.doOnRetry});

  final AppException appException;
  final Completer<void>? exceptionCompleter;
  final Future<void> Function()? doOnRetry;

  @override
  String toString() {
    return 'AppExceptionWrapper(appException: $appException, exceptionCompleter: $exceptionCompleter, doOnRetry: $doOnRetry)';
  }
}
