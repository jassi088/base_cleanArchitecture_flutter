import 'package:dio/dio.dart';

/// Mục đích: sắp xếp sự ưu tiên Interceptor từ cao xuống thấp
abstract class BaseInterceptor extends InterceptorsWrapper {
  static const retryOnErrorPriority = 100; // add first
  static const connectivityPriority = 99; // add second
  static const basicAuthPriority = 40;
  static const refreshTokenPriority = 30;
  static const apiTokenPriority = 20;
  static const customLogPriority = 1; // add last

  /// higher, add first
  /// lower, add last
  int get priority;
}
