import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/system_messages_entity.dart';
import 'package:pub_tran_exercise/generated/json/base/json_convert_content.dart';

class SearchEntity with JsonConvert<SearchEntity> {
  String version;
  List<SystemMessagesEntity> systemMessages;
  List<LocationsEntity> locations;
}
