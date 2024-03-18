import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

@Injectable()
class ConnectivityInterceptor extends BaseInterceptor {
  ConnectivityInterceptor(this._connectivityHelper);

  final ConnectivityHelper _connectivityHelper;

  @override
  int get priority => BaseInterceptor.connectivityPriority;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await _connectivityHelper.isNetworkAvailable) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: NetworkingException(
            networkExceptions: const NetworkExceptions.noInternetConnection(),
          ),
        ),
      );
    }

    return super.onRequest(options, handler);
  }
}
