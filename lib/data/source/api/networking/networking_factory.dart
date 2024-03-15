import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

class NetworkingFactory {
  static Dio createDio({BaseOptions? options, List<Interceptor> Function(Dio)? interceptors}) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ?? Constants.connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? Constants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? Constants.sendTimeout,
        baseUrl: options?.baseUrl ?? UrlConstants.appApiBaseUrl,
      ),
    );

    final sortedInterceptors =
        (interceptors?.call(dio) ?? <Interceptor>[]).sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });

    dio.interceptors.addAll(sortedInterceptors);

    return dio;
  }
}
