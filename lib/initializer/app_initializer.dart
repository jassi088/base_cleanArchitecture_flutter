import '../shared/shared.dart';
import 'config/initializer_config.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  AppInitializer(this._applicationConfig);

  final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    EnvConstants.init();
    await InitializerConfig.getInstance().init();
    await _applicationConfig.init();
  }
}
