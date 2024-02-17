import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

@Injectable()
class ApiTokenInterceptor extends BaseInterceptor {
  ApiTokenInterceptor(this._appInfo, this._appPreferences);

  final AppInfo _appInfo;
  final AppPreferences _appPreferences;

  final Map<String, dynamic> _headers = {};
  @override
  int get priority => BaseInterceptor.apiTokenPriority;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Xử lý HeaderInterceptor
    final userAgentValue = userAgentClientHintsHeader();
    options.headers[ServerRequestResponseConstants.userAgentKey] = userAgentValue;
    options.headers.addAll(_headers);

    // Xử lý AccessTokenInterceptor
    final token = await _appPreferences.accessToken;
    if (token.isNotEmpty) {
      options.headers[ServerRequestResponseConstants.basicAuthorization] =
          '${ServerRequestResponseConstants.bearer} $token';
    }

    // final Options dynamicOptions = Options(
    //   headers: {
    //     HttpHeaders.authorizationHeader: token,
    //     HttpHeaders.contentTypeHeader: 'multipart/form-data',
    //     HttpHeaders.acceptHeader: '*/*',
    //     'Content-Type': 'application/json',
    //   },
    // );
    // options.headers.addAll(dynamicOptions.headers!);

    handler.next(options);
  }

  String userAgentClientHintsHeader() {
    return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
  }
}
