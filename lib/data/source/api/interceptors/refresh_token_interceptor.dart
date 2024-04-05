import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

import '../../../../domain/domain.dart';
import '../../../../shared/shared.dart';
import '../../../data.dart';

@Injectable()
class RefreshTokenInterceptor extends BaseInterceptor {
  RefreshTokenInterceptor(this.dio, this.appPreferences);

  final AppPreferences appPreferences;
  final Dio dio;

  var _isRefreshing = false;
  var _newToken;
  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options: options, handler: handler);
    } else {
      handler.next(err);
    }
  }

  Future<void> _onExpiredToken({
    required RequestOptions options,
    required ErrorInterceptorHandler handler,
  }) async {
    _queue.addLast(Tuple2(options, handler));
    if (!_isRefreshing) {
      _isRefreshing = true;
      try {
        await _refreshToken(options, handler);
        await _onRefreshTokenSuccess(_newToken);
      } catch (e) {
        _onRefreshTokenError(e);
      } finally {
        _isRefreshing = false;
        _queue.clear();
      }
    }
  }

  Future<void> _refreshToken(RequestOptions options, ErrorInterceptorHandler handler) async {
    _isRefreshing = true;
    final refreshToken = await appPreferences.refreshToken;
    try {
      final response = await dio.post(
        'User/renewtoken',
        data: {'refresh_token': refreshToken},
      );

      final refreshTokenResponse = response.data as Token;
      await Future.wait([
        appPreferences.saveAccessToken(refreshTokenResponse.accessToken ?? ''),
        appPreferences.saveRefreshToken(refreshTokenResponse.refreshToken ?? ''),
      ]);

      _newToken = refreshTokenResponse.accessToken;
    } catch (e) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: NetworkingException(
            networkExceptions: const NetworkExceptions.refreshTokenFailed(),
          ),
        ),
      );
    }
  }

  Future<void> _onRefreshTokenSuccess(String newToken) async {
    await Future.wait(_queue.map(
      (requestInfo) => _requestWithNewToken(
        options: requestInfo.item1,
        handler: requestInfo.item2,
        newAccessToken: newToken,
      ),
    ));
  }

  void _onRefreshTokenError(Object? error) {
    _queue.forEach((element) {
      final options = element.item1;
      final handler = element.item2;
      handler.next(DioException(requestOptions: options, error: error));
    });
  }

  Future<void> _requestWithNewToken({
    required RequestOptions options,
    required ErrorInterceptorHandler handler,
    required String newAccessToken,
  }) async {
    options.headers[Constants.basicAuthorization] = '${Constants.bearer} $newAccessToken';

    try {
      final response = await dio.fetch(options);
      handler.resolve(response);
    } catch (e) {
      handler.next(DioException(requestOptions: options, error: e));
    }
  }
}
