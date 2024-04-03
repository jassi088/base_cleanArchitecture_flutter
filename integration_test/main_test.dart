import 'package:base_clean_architecture/main.dart' as app;
import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'common/index.dart';
import 'login_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'main test',
    (tester) async {
      app.main();

      await runLoginTest(tester: tester, binding: binding, username: 'tester', password: '123456');
      await tester.pumpWithDuration(3.seconds);

      await tester.tapOnBottomNavigationTab(2);
      await tester.pumpWithDuration(2.seconds);
      await tester.takeScreenShot(binding: binding, fileName: 'main/setting_tab.png');

      await tester.tapOnBottomNavigationTab(1);
      await tester.pumpWithDuration(2.seconds);
      await tester.takeScreenShot(binding: binding, fileName: 'main/noti_tab.png');

      await tester.tapOnBottomNavigationTab(0);
      await tester.pumpWithDuration(2.seconds);
      await tester.takeScreenShot(binding: binding, fileName: 'main/home_tab.png');
    },
    skip: false,
  );
}
