import 'package:get/get.dart';
import 'package:pub_tran_exercise/main.dart';

class PageRouter {
  static final Bindings initialBinding = BindingsBuilder(() {});

  static final getPages = [
    GetPage(
      name: MyApp.route,
      page: () => MyApp(),
      binding: BindingsBuilder(() => {}),
    ),
  ];
}
