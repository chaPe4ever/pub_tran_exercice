import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pub_tran_exercise/page_router.dart';
import 'package:pub_tran_exercise/ui/views/home_view.dart';

import 'assets/my_app_theme.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  // Allow only portrait mode on Android
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(GetMaterialApp(
    initialBinding: PageRouter.initialBinding,
    theme: MyAppTheme.themeData,
    initialRoute: HomeView.route,
    getPages: PageRouter.getPages,
  ));
}
