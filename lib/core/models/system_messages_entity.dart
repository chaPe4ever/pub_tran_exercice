import 'package:pub_tran_exercise/generated/json/base/json_convert_content.dart';

class SystemMessagesEntity with JsonConvert<SystemMessagesEntity> {
  String type;
  String module;
  int code;
  String text;
}
