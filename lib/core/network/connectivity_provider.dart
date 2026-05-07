import 'package:meaningly/core/network/connectivity_service.dart';
import 'package:meaningly/core/network/connectivity_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
ConnectivityService connectivityService(Ref ref) {
  return ConnectivityService();
}

@riverpod
Stream<ConnectivityStatus> connectivityStatus(Ref ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.connectivityStream;
}
