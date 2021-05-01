import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
import 'package:pub_tran_exercise/page_router.dart';
import 'package:pub_tran_exercise/ui/views/home_view.dart';

GetMaterialApp rootWidget(String initialRoute) => GetMaterialApp(
      initialBinding: PageRouter.initialBinding,
      theme: MyAppTheme.themeData,
      initialRoute: initialRoute,
      getPages: PageRouter.getPages,
    );

Future<void> setupWidget(WidgetTester tester,
    {String initialRoute = HomeView.route}) async {
  await tester.pumpWidget(rootWidget(initialRoute));

  await tester.pumpAndSettle();
}
