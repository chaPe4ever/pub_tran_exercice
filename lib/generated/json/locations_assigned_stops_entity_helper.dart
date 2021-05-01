import 'package:pub_tran_exercise/core/models/locations_assigned_stops_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_assigned_stops_parent_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_assigned_stops_properties_entity.dart';

locationsAssignedStopsEntityFromJson(
    LocationsAssignedStopsEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['isGlobalId'] != null) {
    data.isGlobalId = json['isGlobalId'];
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['disassembledName'] != null) {
    data.disassembledName = json['disassembledName'].toString();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  if (json['coord'] != null) {
    data.coord = (json['coord'] as List)
        .map((v) => v is String ? double.tryParse(v) : v.toDouble())
        .toList()
        .cast<double>();
  }
  if (json['parent'] != null) {
    data.parent = LocationsAssignedStopsParentEntity().fromJson(json['parent']);
  }
  if (json['productClasses'] != null) {
    data.productClasses = (json['productClasses'] as List)
        .map((v) => v is String ? int.tryParse(v) : v.toInt())
        .toList()
        .cast<int>();
  }
  if (json['connectingMode'] != null) {
    data.connectingMode = json['connectingMode'] is String
        ? int.tryParse(json['connectingMode'])
        : json['connectingMode'].toInt();
  }
  if (json['properties'] != null) {
    data.properties =
        LocationsAssignedStopsPropertiesEntity().fromJson(json['properties']);
  }
  return data;
}

Map<String, dynamic> locationsAssignedStopsEntityToJson(
    LocationsAssignedStopsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['isGlobalId'] = entity.isGlobalId;
  data['name'] = entity.name;
  data['disassembledName'] = entity.disassembledName;
  data['type'] = entity.type;
  data['coord'] = entity.coord;
  data['parent'] = entity.parent?.toJson();
  data['productClasses'] = entity.productClasses;
  data['connectingMode'] = entity.connectingMode;
  data['properties'] = entity.properties?.toJson();
  return data;
}
