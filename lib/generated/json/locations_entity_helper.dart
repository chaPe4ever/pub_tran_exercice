import 'package:pub_tran_exercise/core/models/locations_assigned_stops_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_parrent_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_properties_entity.dart';

locationsEntityFromJson(LocationsEntity data, Map<String, dynamic> json) {
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
  if (json['coord'] != null) {
    data.coord = (json['coord'] as List)
        .map((v) => v is String ? double.tryParse(v) : v.toDouble())
        .toList()
        .cast<double>();
  }
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  if (json['matchQuality'] != null) {
    data.matchQuality = json['matchQuality'] is String
        ? int.tryParse(json['matchQuality'])
        : json['matchQuality'].toInt();
  }
  if (json['isBest'] != null) {
    data.isBest = json['isBest'];
  }
  if (json['productClasses'] != null) {
    data.productClasses = (json['productClasses'] as List)
        .map((v) => v is String ? int.tryParse(v) : v.toInt())
        .toList()
        .cast<int>();
  }
  if (json['parent'] != null) {
    data.parent = LocationsParentEntity().fromJson(json['parent']);
  }
  if (json['assignedStops'] != null) {
    data.assignedStops = (json['assignedStops'] as List)
        .map((v) => LocationsAssignedStopsEntity().fromJson(v))
        .toList();
  }
  if (json['properties'] != null) {
    data.properties = LocationsPropertiesEntity().fromJson(json['properties']);
  }
  return data;
}

Map<String, dynamic> locationsEntityToJson(LocationsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['isGlobalId'] = entity.isGlobalId;
  data['name'] = entity.name;
  data['disassembledName'] = entity.disassembledName;
  data['coord'] = entity.coord;
  data['type'] = entity.type;
  data['matchQuality'] = entity.matchQuality;
  data['isBest'] = entity.isBest;
  data['productClasses'] = entity.productClasses;
  data['parent'] = entity.parent?.toJson();
  data['assignedStops'] =
      entity.assignedStops?.map((v) => v.toJson())?.toList();
  data['properties'] = entity.properties?.toJson();
  return data;
}
