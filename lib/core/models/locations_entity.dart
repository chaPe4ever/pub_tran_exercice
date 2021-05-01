import 'package:pub_tran_exercise/core/models/locations_assigned_stops_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_parrent_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_properties_entity.dart';
import 'package:pub_tran_exercise/generated/json/base/json_convert_content.dart';

class LocationsEntity with JsonConvert<LocationsEntity> {
  String id;
  bool isGlobalId;
  String name;
  String disassembledName;
  List<double> coord;
  String type;
  int matchQuality;
  bool isBest;
  List<int> productClasses;
  LocationsParentEntity parent;
  List<LocationsAssignedStopsEntity> assignedStops;
  LocationsPropertiesEntity properties;
}
