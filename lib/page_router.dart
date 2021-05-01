import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/services/data/search_provider_service.dart';
import 'package:pub_tran_exercise/ui/views/home_view.dart';

import 'core/contracts/general/i_api_auth_provider.dart';
import 'core/contracts/general/i_connectivity.dart';
import 'core/controllers/home_controller.dart';
import 'core/services/general/api_auth_provider_service.dart';
import 'core/services/general/connectivity_service.dart';

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
            Get.put<ISearchProvider>(SearchProviderService()),
          }),
    ),
  ];
}
