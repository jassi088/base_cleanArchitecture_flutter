import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _appPreferences.accessToken;
    if (token.isNotEmpty) {
      options.headers[ServerRequestResponseConstants.basicAuthorization] =
          '${ServerRequestResponseConstants.bearer} $token';

      // final Options dynamicOptions = Options(
      //   headers: {
      //     HttpHeaders.authorizationHeader: token,
      //     HttpHeaders.contentTypeHeader: 'multipart/form-data',
      //     HttpHeaders.acceptHeader: '*/*',
      //     'Content-Type': 'application/json',
      //   },
      // );
      // options.headers.addAll(dynamicOptions.headers!);
    }

    handler.next(options);
  }
}
