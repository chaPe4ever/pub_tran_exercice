import 'package:pub_tran_exercise/core/models/locations_assigned_stops_parent_entity.dart';

locationsAssignedStopsParentEntityFromJson(
    LocationsAssignedStopsParentEntity data, Map<String, dynamic> json) {
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  return data;
}

Map<String, dynamic> locationsAssignedStopsParentEntityToJson(
    LocationsAssignedStopsParentEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}
