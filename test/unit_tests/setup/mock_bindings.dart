import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_connectivity.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';

import 'mocks_instances.dart';

BindingsBuilder initialMockBindings = BindingsBuilder(() {
  Get.lazyPut<IApiAuthProvider>(() => ApiAuthProviderServiceMock(),
      fenix: true);
  Get.put<IConnectivity>(ConnectivityServiceMock(), permanent: true);
});

BindingsBuilder homeViewMockBindings = BindingsBuilder(() {
  Get.lazyPut<HomeController>(() => HomeController());
  Get.put<ISearchProvider>(SearchProviderServiceMock());
});
