import 'package:flutter/services.dart';

var log = <MethodCall>[];

void setUpGetStorageMockChannel() {
  const get_storage_channel = MethodChannel('plugins.flutter.io/path_provider');

  get_storage_channel.setMockMethodCallHandler(
    (MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '.';
      }
    },
  );
}
