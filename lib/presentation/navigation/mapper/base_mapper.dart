import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
