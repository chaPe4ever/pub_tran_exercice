import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';

import '../setup/test_data.dart';
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
        expect(homeController.locations, <LocationsEntity>[]);
        expect(homeController.customFloatingSearchBarController.isBlank, false);
        expect(homeController.locationPicked, isA<LocationsEntity>());
      });
    });
    group('Public methods -', () {
      test(
          'When onQueryChanged called and is connected to internet and query is empty and floatingSearchBar is open, should show the locations from history',
          () async {
        /// Arrange
        var connectivityServiceMock =
            await resetStubAndGetConnectivityServiceMock();
        HomeController homeController = Get.find();

        /// Act
        await homeController.onQueryChanged('');

        /// Assert
        verify(connectivityServiceMock.isConnected).called(1);
        expect(homeController.locations.length, 0);
      });

      test(
          'When onQueryChanged called and is connected to internet and query is not empty, should get data from API and populate locations list',
          () async {
        /// Arrange
        const String searchQuery = 'MyQuery';
        SearchEntity searchEntityMock = SearchEntityMock();
        var connectivityServiceMock =
            await resetStubAndGetConnectivityServiceMock();
        var searchProviderServiceMock =
            await resetStubAndGetSearchProviderServiceMock(
                stubSearchEntity: searchEntityMock, searchText: searchQuery);
        HomeController homeController = Get.find();

        /// Act
        await homeController.onQueryChanged(searchQuery);

        /// Assert
        verify(connectivityServiceMock.isConnected).called(1);
        verify(searchProviderServiceMock.getSearchResultsBySearchingText(
                searchingText: searchQuery))
            .called(1);
        expect(homeController.locations.length, isNonZero);
      });
    });
  });
}
