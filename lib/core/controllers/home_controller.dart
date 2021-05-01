import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';

import 'base_controller.dart';

class HomeController extends SuperController with BaseController {
  // Fields
  Rx<int> _rxCounter;
  IConnectivity _connectivityService;
  ISearchProvider _searchProviderService;

  // Getters
  int get counter => _rxCounter.value;

  // Setters

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    isBusy = true;
    super.onInit();
    _rxCounter = 0.obs;

    _connectivityService = Get.find();
    _searchProviderService = Get.find();

    isBusy = false;

    // Listen to connection changes
    // _connectivityService.connectionStatusController?.stream
    //     .listen((enumConnectivityStatus) {
    //   print(enumConnectivityStatus.toString());
    // });
  }

  @override
  void onDetached() {
    printInfo(info: 'onDetached');
  }

  @override
  void onInactive() {
    printInfo(info: 'onInactive');
  }

  @override
  void onPaused() {
    printInfo(info: 'onPaused');
  }

  @override
  void onResumed() {
    printInfo(info: 'onResumed');
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Methods
  void incrementCounter() async {
    try {
      _rxCounter.value++;
    } catch (e) {
      print(e.toString());
    }
  }
}
