/// REST Api
const String kBaseUrl = 'https://mvvvip1.defas-fgi.de';
const String kTokenUrl = 'https://your_token_url';

const String kSearchApiPath =
    '/mvv/XML_STOPFINDER_REQUEST?language=de&outputFormat=RapidJSON&type_sf=any';

/// GetStorage keys
const String kApiAuthToken = 'apiAuthToken';
const String kLocationsHistory = 'locationsHistory';

/// Strings-Sentences
const String kConnectionError = 'Connection  Error';
const String kConnectionMsg =
    'Your connection is down. Please make sure you are connected to the internet';

/// Asset paths
const kTramIconAssetPath = 'lib/assets/images/Tram.png';
const kBusIconAssetPath = 'lib/assets/images/BUS.png';
const kSBahnIconAssetPath = 'lib/assets/images/S-Bahn.png';
const kUBahnIconAssetPath = 'lib/assets/images/U-Bahn.png';
const kMentzLogoIconAssetPath = 'lib/assets/images/mentz.png';

/// Test keys

// Test strings
const String kServiceTest = 'service_test';
const Map<String, dynamic> kQueryMockCallback = {
  "version": "10.4.15.5",
  "systemMessages": [
    {"type": "error", "module": "BROKER", "code": -8010, "text": ""}
  ],
  "locations": [
    {
      "id": "de:09162:6",
      "isGlobalId": true,
      "name": "München, Hauptbahnhof",
      "disassembledName": "Hauptbahnhof",
      "coord": [5869818.0, 1286972.0],
      "type": "stop",
      "matchQuality": 1000,
      "isBest": true,
      "productClasses": [0, 1, 2, 4, 5, 6, 17],
      "parent": {
        "id": "placeID:9162000:1",
        "name": "München",
        "type": "locality"
      },
      "assignedStops": [
        {
          "id": "de:09162:6",
          "isGlobalId": true,
          "name": "München, Hauptbahnhof (S, U, Bus, Tram)",
          "disassembledName": "Hauptbahnhof (S, U, Bus, Tram)",
          "type": "stop",
          "coord": [5869818.0, 1286972.0],
          "parent": {"name": "München", "type": "locality"},
          "productClasses": [1, 2, 4],
          "connectingMode": 100,
          "properties": {"stopId": "91000006"}
        },
        {
          "id": "de:09162:100",
          "isGlobalId": true,
          "name": "München Hbf",
          "type": "stop",
          "coord": [5869774.0, 1286809.0],
          "parent": {"name": "München", "type": "locality"},
          "productClasses": [0, 1, 17],
          "connectingMode": 100,
          "properties": {"stopId": "91000100"}
        },
        {
          "id": "de:09162:5000",
          "isGlobalId": true,
          "name": "Hauptbahnhof Süd",
          "type": "stop",
          "coord": [5869946.0, 1286756.0],
          "parent": {"name": "München", "type": "locality"},
          "productClasses": [4, 5],
          "connectingMode": 100,
          "properties": {"stopId": "91005000"}
        },
        {
          "id": "de:09162:7000",
          "isGlobalId": true,
          "name": "Hauptbahnhof Nord",
          "type": "stop",
          "coord": [5869598.0, 1286846.0],
          "parent": {"name": "München", "type": "locality"},
          "productClasses": [0, 4, 5, 6],
          "connectingMode": 100,
          "properties": {"stopId": "91007000"}
        }
      ],
      "properties": {"stopId": "91000006"}
    }
  ]
};
