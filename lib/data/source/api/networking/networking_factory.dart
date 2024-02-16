import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

class NetworkingFactory {
  static List<Interceptor> requiredInterceptors(Dio dio) => [
        if (kDebugMode) CustomLogInterceptor(),
        ConnectivityInterceptor(),
        RetryOnErrorInterceptor(dio),
      ];

  static Dio createDio({BaseOptions? options, List<Interceptor> interceptors = const []}) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ?? ServerTimeoutConstants.connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? ServerTimeoutConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ServerTimeoutConstants.sendTimeout,
        baseUrl: options?.baseUrl ?? UrlConstants.appApiBaseUrl,
      ),
    );

    final sortedInterceptors = [
      ...requiredInterceptors(dio),
      ...interceptors,
    ].sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });

    dio.interceptors.addAll(sortedInterceptors);

    return dio;
  }
}
