import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:url_strategy/url_strategy.dart';

import '../domain/domain.dart';
import '../initializer/initializer.dart';
import '../shared/shared.dart';
import 'app.dart';

abstract class IAppDelegate {
  Future<Widget> build();
  Future<void> run();
}

@singleton
class AppDelegate extends IAppDelegate {
  AppDelegate();

  @override
  Future<Widget> build() async {
    final initialResource = getIt.get<AppUsecase>().loadInitialResourceUseCase;
    return MyApp(initialResource: initialResource);
  }

  @override
  Future<void> run() async {
    await runZonedGuarded(_runMyApp, _reportError);
  }

  /*-----------------------------------------------------------------------------------*/
  Future<void> _runMyApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await AppInitializer(InitializerConfig.getInstance()).init();
    if (kIsWeb) setPathUrlStrategy();

    final app = await build();
    runApp(app);
  }

  void _reportError(Object error, StackTrace stackTrace) {
    Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

    // report by Firebase Crashlytics here
  }
}
