import '../data/data.dart';
import '../domain/domain.dart';
import '../shared/shared.dart';

abstract class ApplicationConfig extends Config {}

class AppInitializer {
  // AppInitializer(this._applicationConfig);
  AppInitializer();

  // final ApplicationConfig _applicationConfig;

  Future<void> init() async {
    EnvConstants.init();
    await SharedConfig.getInstance().init();
    await DataConfig.getInstance().init();
    await DomainConfig.getInstance().init();
    // await _applicationConfig.init();
  }
}
