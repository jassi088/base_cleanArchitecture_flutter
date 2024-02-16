import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/shared.dart';
import '../data.dart';
import 'di.config.dart';

@module
abstract class ServiceModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @prod
  Dio dioProd() => NetworkingFactory.createDio(
        interceptors: [
          HeaderInterceptor(GetIt.instance.get<AppInfo>()),
          AccessTokenInterceptor(GetIt.instance.get<AppPreferences>()),
        ],
      );
}

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
