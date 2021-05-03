import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';
import 'package:pub_tran_exercise/globals/constants.dart';

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

  group('SearchProviderServiceTests -', () {
    group('Methods -', () {
      test(
          'When getSearchResultsBySearchingText called, should use the api to get data and decode to its entity',
          () async {
        /// Arrange
        const String searchQuery = 'MyQuery';
        SearchEntity searchEntityMock =
            SearchEntity().fromJson(kQueryMockCallback);

        await resetStubAndGetApiAuthProviderMock(
            path: '$kSearchApiPath&name_sf=$searchQuery',
            getAsyncMockCallback: kQueryMockCallback);

        Get.find<HomeController>();
        await Future.delayed(Duration.zero);
        ISearchProvider searchProviderService = Get.find(tag: kServiceTest);
        await Future.delayed(Duration.zero);

        /// Act
        SearchEntity searchResult = await searchProviderService
            .getSearchResultsBySearchingText(searchingText: searchQuery);

        /// Assert
        expect(searchEntityMock.locations.first.name,
            searchResult.locations.first.name);
        expect(searchEntityMock.version, searchResult.version);
        expect(searchEntityMock.systemMessages.first.text,
            searchResult.systemMessages.first.text);
      });
    });
  });
}
