import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_tran_exercise/core/models/locations_assigned_stops_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_assigned_stops_parent_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_assigned_stops_properties_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_parrent_entity.dart';
import 'package:pub_tran_exercise/core/models/locations_properties_entity.dart';
import 'package:pub_tran_exercise/core/models/search_entity.dart';
import 'package:pub_tran_exercise/core/models/system_messages_entity.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Random _rnd = Random(DateTime.now().microsecondsSinceEpoch);

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

int getNextRandomInt(int max) => _rnd.nextInt(max - 1) + 1;

/// Write your fake/mock data below
class SearchEntityMock extends Fake implements SearchEntity {
  @override
  String version = getRandomString(4);
  @override
  List<SystemMessagesEntity> systemMessages = <SystemMessagesEntity>[];
  @override
  List<LocationsEntity> locations = [
    LocationEntityMock(customType: 'poi'),
    LocationEntityMock(customType: 'street'),
    LocationEntityMock(customType: 'stop'),
    LocationEntityMock(customType: 'suburb'),
  ];
}

class LocationEntityMock extends Fake implements LocationsEntity {
  final String customType;
  LocationEntityMock({@required this.customType}) : type = customType;
  @override
  String id = getRandomString(5);
  @override
  bool isGlobalId = _rnd.nextBool();
  @override
  String name = getRandomString(5);
  @override
  String disassembledName = getRandomString(5);
  @override
  List<double> coord = [0.01, 0.02];
  @override
  String type;
  @override
  int matchQuality = getNextRandomInt(5);
  @override
  bool isBest = _rnd.nextBool();
  @override
  List<int> productClasses = [1, 2, 4, 5];
  @override
  LocationsParentEntity parent = LocationsParentEntityMock();
  @override
  List<LocationsAssignedStopsEntity> assignedStops = [
    LocationsAssignedStopsEntityMock(customType: 'poi'),
    LocationsAssignedStopsEntityMock(customType: 'street'),
    LocationsAssignedStopsEntityMock(customType: 'stop'),
    LocationsAssignedStopsEntityMock(customType: 'suburb'),
  ];
  @override
  LocationsPropertiesEntity properties;
  @override
  bool inHistory;
}

class LocationsParentEntityMock extends Fake implements LocationsParentEntity {
  @override
  String id = getRandomString(5);
  @override
  String name = getRandomString(5);
  @override
  String type = getRandomString(5);
}

class LocationsAssignedStopsEntityMock extends Fake
    implements LocationsAssignedStopsEntity {
  final String customType;
  LocationsAssignedStopsEntityMock({@required this.customType})
      : type = customType;
  @override
  String id = getRandomString(5);
  @override
  bool isGlobalId = _rnd.nextBool();
  @override
  String name = getRandomString(5);
  @override
  String disassembledName = getRandomString(5);
  @override
  String type;
  @override
  List<double> coord;
  @override
  LocationsAssignedStopsParentEntity parent;
  @override
  List<int> productClasses = [1, 2, 4, 5];
  @override
  int connectingMode;
  @override
  LocationsAssignedStopsPropertiesEntity properties;
}
