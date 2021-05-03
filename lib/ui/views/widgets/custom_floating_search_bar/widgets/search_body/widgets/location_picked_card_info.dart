import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';
import 'package:pub_tran_exercise/ui/shared_widgets/populate_location_type_icon.dart';

class LocationPickedCardInfo extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: PopulateLocationTypeIcon(type: controller.locationPicked.type),
        ),
        Helpers.horizontalSpace(10.0),
        Flexible(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.locationPicked.disassembledName,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.disassembledNameTS,
              ),
              Helpers.verticalSpace(5.0),
              Text(
                controller.locationPicked.name,
                style: Get.textTheme.locNameTS,
              ),
            ],
          ),
        ),
        Helpers.horizontalSpace(10.0),
        IconButton(
            onPressed: () => controller.onClearButtonTapped(),
            icon: Icon(Icons.clear)),
      ],
    );
  }
}
