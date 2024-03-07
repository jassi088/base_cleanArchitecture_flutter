import '../../domain/domain.dart';
import '../../shared/shared.dart';

class ExceptionHandler {
  const ExceptionHandler({required this.navigator, required this.listener});

  final AppNavigator navigator;
  final ExceptionHandlerListener listener;

  Future<void> handleException(AppExceptionWrapper appExceptionWrapper, String message) async {
    switch (appExceptionWrapper.appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appExceptionWrapper.appException as NetworkingException;
        await exception.networkExceptions.maybeWhen(
          noInternetConnection: () async {
            return await _showErrorDialogWithRetry(
              message: message,
              onRetryPressed: () async {
                await navigator.pop();
                await appExceptionWrapper.doOnRetry?.call();
              },
            );
          },
          orElse: () async => _showErrorSnackBar(message: message),
        );
        break;
      case AppExceptionType.parse:
        return _showErrorSnackBar(message: message);
      case AppExceptionType.validation:
        await _showErrorDialog(message: message);
        break;
    }
  }

  void _showErrorSnackBar({
    required String message,
    Duration duration = Constants.defaultErrorVisibleDuration,
  }) {
    navigator.showErrorSnackBar(message, duration: duration);
  }

  Future<void> _showErrorDialog({
    required String message,
    Function()? onPressed,
    bool isRefreshTokenFailed = false,
  }) async {
    await navigator
        .showDialog(AppPopupInfo.confirmDialog(message: message, onPressed: onPressed))
        .then((value) {
      if (isRefreshTokenFailed) {
        listener.onRefreshTokenFailed();
      }
    });
  }

  Future<void> _showErrorDialogWithRetry({
    required String message,
    required Function()? onRetryPressed,
  }) async {
    await navigator.showDialog(
        AppPopupInfo.errorWithRetryDialog(message: message, onRetryPressed: onRetryPressed));
  }
}

abstract class ExceptionHandlerListener {
  void onRefreshTokenFailed();
}
