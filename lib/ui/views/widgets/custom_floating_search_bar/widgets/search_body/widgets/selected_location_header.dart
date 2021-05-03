import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';

class SelectedLocationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Selected location info',
      textAlign: TextAlign.start,
      style: Get.theme.textTheme.assignedStopsTS,
    );
  }
}
