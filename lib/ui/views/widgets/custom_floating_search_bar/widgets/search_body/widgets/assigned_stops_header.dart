import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';

class AssignedStopsHeader extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller?.locationPicked?.assignedStops != null
        ? Text(
            'Assigned Stops',
            textAlign: TextAlign.start,
            style: Get.theme.textTheme.assignedStopsTS,
          )
        : SizedBox();
  }
}
