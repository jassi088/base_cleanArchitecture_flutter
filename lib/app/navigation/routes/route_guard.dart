import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../app.dart';

@Injectable()
class RouteGuard extends AutoRouteGuard {
  RouteGuard(this._appUsecase);

  final AppUsecase _appUsecase;

  bool get _isLoggedIn => _appUsecase.isLoggedInUseCase;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
      resolver.next(false);
    }
  }
}
