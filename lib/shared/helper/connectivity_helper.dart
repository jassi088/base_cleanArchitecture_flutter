import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ConnectivityHelper {
  Future<bool> get isNetworkAvailable async {
    final result = await Connectivity().checkConnectivity();

    return result != ConnectivityResult.none;
  }

  Stream<bool> get onConnectivityChanged {
    return Connectivity().onConnectivityChanged.map((event) {
      return event != ConnectivityResult.none;
    });
  }
}
