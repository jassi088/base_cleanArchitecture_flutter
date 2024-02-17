import '../../shared/shared.dart';
import '../di/di.dart' as di;

class InitializerConfig extends Config {
  factory InitializerConfig.getInstance() {
    return _instance;
  }

  InitializerConfig._();

  static final InitializerConfig _instance = InitializerConfig._();

  @override
  Future<void> config() async => di.configureInjection();
}
