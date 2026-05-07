import 'dart:async';
import 'package:meaningly/core/network/connectivity_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/network/connectivity_status.dart';

part 'connectivity_banner_notifier.g.dart';

enum BannerState { hidden, offline, restored}

@riverpod
class ConnectivityBannerNotifier extends _$ConnectivityBannerNotifier {
  Timer? _hideTimer;

  @override
  BannerState build() {
    ref.onDispose(() => _hideTimer?.cancel());

    ref.listen(connectivityStatusProvider, (prev, next) {
      next.whenData((status) {
        final prevStatus = prev?.when(
          data: (v) => v,
          loading: () => null,
          error: (_,_) => null
        );
        if (status == ConnectivityStatus.offline) {
          _hideTimer?.cancel();
          state = BannerState.offline;
        } else if(status == ConnectivityStatus.online && prevStatus == ConnectivityStatus.offline) {
          state = BannerState.restored;
          _hideTimer?.cancel();
          _hideTimer = Timer(const Duration(seconds: 3), () {
            state = BannerState.hidden;
          });
        }
      });
    });
    return BannerState.hidden;
  }
}