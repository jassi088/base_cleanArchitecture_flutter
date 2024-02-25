import 'package:flutter/material.dart';

import 'app/app.dart';
import 'initializer/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppInitializer().init();

  runApp(const MyApp());
}
