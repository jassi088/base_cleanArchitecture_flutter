import 'dart:async';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'domain/domain.dart';
import 'initializer/initializer.dart';
import 'shared/shared.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppInitializer(InitializerConfig.getInstance()).init();

  final initialResource = await _loadInitialResource();
  runApp(MyApp(initialResource: initialResource));
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}

Future<List<InitialAppRoute>> _loadInitialResource() async {
  final result = runCatching(action: () => getIt.get<AppUsecase>().loadInitialResourceUseCase);

  return result.when(
    success: (output) => output,
    failure: (e) => const [InitialAppRoute.main],
  );
}
