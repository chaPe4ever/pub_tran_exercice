import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Random _rnd = Random(DateTime.now().microsecondsSinceEpoch);

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

int getNextRandomInt(int max) => _rnd.nextInt(max - 1) + 1;

/// Write your fake/mock data below
