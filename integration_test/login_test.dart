import 'package:base_clean_architecture/main.dart' as app;
import 'package:base_clean_architecture/presentation/presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'common/index.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'login test',
    (tester) async {
      app.main();

      await runLoginTest(
        tester: tester,
        binding: binding,
        username: 'tester',
        password: '12345',
        screenshotName: 'login/login_failed.png',
      );

      await runLoginTest(
        tester: tester,
        binding: binding,
        username: 'tester',
        password: '123456',
        screenshotName: 'login/login_successful.png',
      );
    },
    skip: false,
  );
}

Future<void> runLoginTest({
  required WidgetTester tester,
  required IntegrationTestWidgetsFlutterBinding binding,
  required String username,
  required String password,
  String? screenshotName,
}) async {
  await tester.openLoginPage();

  final usernameTextField = find.byType(AppTextField).first;
  await tester.enterText(usernameTextField, username);
  await tester.pumpWithDuration(1.seconds);

  final passwordTextField = find.byType(AppTextField).last;
  await tester.enterText(passwordTextField, password);
  await tester.pumpWithDuration(1.seconds);

  await tester.dismissOnScreenKeyboard();

  final loginButtonFinder = find.byType(ElevatedButton);
  expect(loginButtonFinder, findsOneWidget);
  await tester.tap(loginButtonFinder);
  await tester.pumpWithDuration(2.seconds);

  if (screenshotName == null || screenshotName.isEmpty) return;

  await tester.takeScreenShot(binding: binding, fileName: screenshotName);
  await tester.pumpWithDuration(5.seconds);
}
