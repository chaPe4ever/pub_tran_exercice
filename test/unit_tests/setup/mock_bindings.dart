import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/services/api_auth_provider_service.dart';
import 'package:pub_tran_exercise/core/services/connectivity_service.dart';

BindingsBuilder initialMockBindings = BindingsBuilder(() {
  Get.lazyPut<IApiAuthProvider>(() => ApiAuthProviderService(), fenix: true);
  Get.put<IConnectivity>(ConnectivityService(), permanent: true);
});

BindingsBuilder homeViewMockBindings = BindingsBuilder(() {
  Get.lazyPut<HomeController>(() => HomeController());
});
