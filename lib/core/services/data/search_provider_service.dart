import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/contracts/data/i_search_provider.dart';
import 'package:pub_tran_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';
import 'package:pub_tran_exercise/globals/constants.dart';

class SearchProviderService implements ISearchProvider {
  IApiAuthProvider _apiAuthProviderService = Get.find();

  @override
  Future<SearchEntity> getSearchResultsBySearchingText(
      {@required String searchingText}) async {
    SearchEntity searchEntityToReturn = SearchEntity();

    try {
      var rawSearchEntity = await _apiAuthProviderService.getAsync(
          path: '$kSearchApiPath&name_sf=$searchingText');

      searchEntityToReturn.fromJson(rawSearchEntity);
    } catch (e) {
      printError(info: e.toString());
      rethrow;
    }

    return searchEntityToReturn;
  }
}
