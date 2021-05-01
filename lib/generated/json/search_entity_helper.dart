import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';
import 'package:pub_tran_exercise/core/models/system_messages_entity.dart';

searchEntityFromJson(SearchEntity data, Map<String, dynamic> json) {
  if (json['version'] != null) {
    data.version = json['version'].toString();
  }
  if (json['systemMessages'] != null) {
    data.systemMessages = (json['systemMessages'] as List)
        .map((v) => SystemMessagesEntity().fromJson(v))
        .toList();
  }
  if (json['locations'] != null) {
    data.locations = (json['locations'] as List)
        .map((v) => LocationsEntity().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> searchEntityToJson(SearchEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['version'] = entity.version;
  data['systemMessages'] =
      entity.systemMessages?.map((v) => v.toJson())?.toList();
  data['locations'] = entity.locations?.map((v) => v.toJson())?.toList();
  return data;
}
