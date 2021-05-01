import 'package:pub_tran_exercise/core/models/locations_assigned_stops_properties_entity.dart';

locationsAssignedStopsPropertiesEntityFromJson(
    LocationsAssignedStopsPropertiesEntity data, Map<String, dynamic> json) {
  if (json['stopId'] != null) {
    data.stopId = json['stopId'].toString();
  }
  return data;
}

Map<String, dynamic> locationsAssignedStopsPropertiesEntityToJson(
    LocationsAssignedStopsPropertiesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['stopId'] = entity.stopId;
  return data;
}
