import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';
import 'package:pub_tran_exercise/core/enums/enum_connectivity_status.dart';

class ConnectivityService implements IConnectivity {
  // Fields
  StreamSubscription<ConnectivityResult> _subscription;

  StreamController<EnumConnectivityStatus> _connectionStatusController;

  // Initialisation
  ConnectivityService() {
    _connectionStatusController = StreamController<EnumConnectivityStatus>();
    // Subscribe to the connectivity Changed Steam
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Cannot have lifeCycle methods cause tests crash on initialisation for now
  void onClose() {
    _connectionStatusController.close();
    _subscription.cancel();
  }

  @override
  Future<bool> get isConnected async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult != ConnectivityResult.none;
  }

  @override
  StreamController<EnumConnectivityStatus> get connectionStatusController =>
      _connectionStatusController;

  // Methods
  // Convert from the third part enum to our own enum
  EnumConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return EnumConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return EnumConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return EnumConnectivityStatus.Offline;
      default:
        return EnumConnectivityStatus.Offline;
    }
  }
}
