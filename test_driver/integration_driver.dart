import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async {
  // Setup permissions
  final Map<String, String> envVars = Platform.environment;
  final String adbPath =
      envVars['HOME'] + '/Library/Android/sdk/platform-tools/adb';

  await Process.run(adbPath, [
    'shell',
    'pm',
    'grant',
    'com.example.apppackage',
    'android.permission.INTERNET'
  ]);

  await integrationDriver();
}
