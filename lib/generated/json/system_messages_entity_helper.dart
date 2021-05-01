import 'package:pub_tran_exercise/core/models/system_messages_entity.dart';

systemMessagesEntityFromJson(
    SystemMessagesEntity data, Map<String, dynamic> json) {
  if (json['type'] != null) {
    data.type = json['type'].toString();
  }
  if (json['module'] != null) {
    data.module = json['module'].toString();
  }
  if (json['code'] != null) {
    data.code = json['code'] is String
        ? int.tryParse(json['code'])
        : json['code'].toInt();
  }
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  return data;
}

Map<String, dynamic> systemMessagesEntityToJson(SystemMessagesEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['type'] = entity.type;
  data['module'] = entity.module;
  data['code'] = entity.code;
  data['text'] = entity.text;
  return data;
}
