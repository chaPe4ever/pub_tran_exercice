import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';

import '../setup/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerChannels();
  });

  setUp(() async {
    await registerServices();
  });

  tearDown(() async {
    await unregisterServices();
  });

  group('HomeControllerTest -', () {
    group('Lifecycle methods -', () {
      test('When controller called, should be and have all fields initialised',
          () async {
        /// Arrange
        HomeController homeController = Get.find();

        /// Act
        await Future.delayed(Duration.zero);

        /// Assert
        expect(homeController.initialized, true);
      });
    });
    group('Public methods -', () {});
  });
}
