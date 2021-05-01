import 'package:pub_tran_exercise/core/models/locations_parrent_entity.dart';

locationsParentEntityFromJson(
    LocationsParentEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  return data;
}

Map<String, dynamic> locationsParentEntityToJson(LocationsParentEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}
