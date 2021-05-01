import 'package:pub_tran_exercise/generated/json/base/json_convert_content.dart';

import 'locations_assigned_stops_parent_entity.dart';
import 'locations_assigned_stops_properties_entity.dart';

class LocationsAssignedStopsEntity
    with JsonConvert<LocationsAssignedStopsEntity> {
  String id;
  bool isGlobalId;
  String name;
  String disassembledName;
  String type;
  List<double> coord;
  LocationsAssignedStopsParentEntity parent;
  List<int> productClasses;
  int connectingMode;
  LocationsAssignedStopsPropertiesEntity properties;
}
