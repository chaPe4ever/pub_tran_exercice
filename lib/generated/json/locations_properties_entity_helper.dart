import 'package:pub_tran_exercise/core/models/locations_properties_entity.dart';

locationsPropertiesEntityFromJson(
    LocationsPropertiesEntity data, Map<String, dynamic> json) {
  if (json['stopId'] != null) {
    data.stopId = json['stopId'].toString();
  }
  return data;
}

Map<String, dynamic> locationsPropertiesEntityToJson(
    LocationsPropertiesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['stopId'] = entity.stopId;
  return data;
}
