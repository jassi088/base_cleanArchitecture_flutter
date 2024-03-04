import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../../initializer/initializer.dart';
import '../../presentation.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: MainRoute.page,
          guards: [RouteGuard(getIt.get<AppUsecase>())],
          children: [
            AutoRoute(
              page: HomeTab.page,
              maintainState: true,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                // AutoRoute(page: ItemDetailRoute.page),
              ],
            ),
            AutoRoute(
              page: NotiTab.page,
              maintainState: true,
              children: [
                AutoRoute(page: NotiRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: SettingTab.page,
              maintainState: true,
              children: [
                AutoRoute(page: SettingRoute.page, initial: true),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'NotiTab')
class NotiTabPage extends AutoRouter {
  const NotiTabPage({super.key});
}

@RoutePage(name: 'SettingTab')
class SettingTabPage extends AutoRouter {
  const SettingTabPage({super.key});
}
