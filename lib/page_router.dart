import 'package:get/get.dart';
import 'package:pub_tran_exercise/ui/views/home_view.dart';

import 'core/contracts/general/i_api_auth_provider.dart';
import 'core/contracts/general/i_connectivity.dart';
import 'core/controllers/home_controller.dart';
import 'core/services/api_auth_provider_service.dart';
import 'core/services/connectivity_service.dart';

class PageRouter {
  static final Bindings initialBinding = BindingsBuilder(() {
    Get.lazyPut<IApiAuthProvider>(() => ApiAuthProviderService(), fenix: true);
    Get.put<IConnectivity>(ConnectivityService(), permanent: true);
  });

  static final getPages = [
    GetPage(
      name: HomeView.route,
      page: () => HomeView(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => HomeController()),
          }),
    ),
  ];
}
