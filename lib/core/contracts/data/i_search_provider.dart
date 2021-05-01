import 'package:flutter/cupertino.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';

abstract class ISearchProvider {
  Future<SearchEntity> getSearchResultsBySearchingText(
      {@required String searchingText});
}
