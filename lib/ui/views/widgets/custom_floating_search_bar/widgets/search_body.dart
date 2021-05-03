import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';

class SearchBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 65.0, left: 5.0, right: 5.0),
          child: controller?.locationPicked?.id == null
              ? SizedBox()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: populateLocTypeIcon(
                              controller.locationPicked.type),
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

Widget populateLocTypeIcon(String type) {
  switch (type) {
    case 'poi':
      return Icon(Icons.location_on_outlined);
    case 'street':
      return Icon(Icons.edit_road_sharp);
    case 'stop':
      return Icon(Icons.directions_train_sharp);
    case 'suburb':
      return Icon(Icons.home_work_sharp);
    default:
      return SizedBox();
  }
}
