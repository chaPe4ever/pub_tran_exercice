import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';

import 'mock_bindings.dart';
import 'mock_chanels.dart';

Future<IApiAuthProvider> resetStubAndGetApiAuthProviderMock() async {
  IApiAuthProvider service = Get.find();
  reset(service);

  // stubbing

  return service;
}

Future<IConnectivity> resetStubAndGetConnectivityServiceMock(
    {bool isConnected = true}) async {
  IConnectivity service = Get.find();
  reset(service);

  // stubbing
  when(service.isConnected).thenAnswer((_) async => isConnected);

  return service;
}

Future<void> registerServices() async {
  try {
    initialMockBindings.builder();
    homeViewMockBindings.builder();
  } catch (e) {
    print(e.toString());
  }

  await GetStorage.init();
}

Future<void> unregisterServices() async {
  Get.reset();
  // Close stream-subscription
  // Get.find<IConnectivity>().onClose();
}

void registerChannels() {
  setUpGetStorageMockChannel();
}
