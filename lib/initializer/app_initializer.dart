import 'package:get_it/get_it.dart';

import '../shared/shared.dart';
import 'config/initializer_config.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  // AppInitializer(this._applicationConfig);
  AppInitializer();

  // final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    EnvConstants.init();
    await InitializerConfig.getInstance().init();
    await GetIt.instance.get<AppInfo>().init();

    // await _applicationConfig.init();
  }
}
