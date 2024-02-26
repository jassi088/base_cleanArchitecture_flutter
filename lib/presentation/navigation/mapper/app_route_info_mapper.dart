import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../presentation.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      login: () => const LoginRoute(),
      main: () => const MainRoute(),
      itemDetail: (user) => const LoginRoute(),
      // itemDetail: (user) => ItemDetailRoute(user: user),
    );
  }
}
