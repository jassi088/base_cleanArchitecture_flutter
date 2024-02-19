import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

abstract class BaseRouteInfoMapper {
  PageRouteInfo map(AppRouteInfo appRouteInfo);
}

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
