import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';

class LocationInfoArea extends StatelessWidget {
  final LocationsEntity location;

  LocationInfoArea({
    @required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          location?.disassembledName ?? location?.name ?? '',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: Get.theme.textTheme.disassembledNameTS,
        ),
        Helpers.verticalSpace(3.0),
        location?.parent?.name != null
            ? Text(
                location.parent.name,
                textAlign: TextAlign.start,
                style: Get.theme.textTheme.locParentNameTS,
              )
            : SizedBox(),
      ],
    );
  }
}
