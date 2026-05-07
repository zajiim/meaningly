import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meaningly/core/network/connectivity_status.dart';

class ConnectivityService {

  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityStatus> get connectivityStream {
    return _connectivity.onConnectivityChanged.map((results) {
      if (results.contains(ConnectivityResult.none)) {
        return ConnectivityStatus.offline;
      } else {
        return ConnectivityStatus.online;
      }
    });
  }

  Future<ConnectivityStatus> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    if(result.contains(ConnectivityResult.none)) {
      return ConnectivityStatus.offline;
    } else {
      return ConnectivityStatus.online;
    }
  }
}