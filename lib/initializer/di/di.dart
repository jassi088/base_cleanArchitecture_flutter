import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data.dart';

import '../../shared/shared.dart';
import 'di.config.dart';

@module
abstract class ServiceModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @prod
  Dio dioProd(SharedPreferences sharedPreferences) => NetworkingFactory.createDio(
        options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
        interceptors: [
          ApiTokenInterceptor(
            getIt.get<AppInfo>(),
            getIt.get<AppPreferences>(),
          ),
        ],
      );
}

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init(environment: Environment.prod);
