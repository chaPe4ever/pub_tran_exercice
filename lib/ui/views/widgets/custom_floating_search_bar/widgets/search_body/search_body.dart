import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/widgets/assigned_stops_header.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/widgets/assigned_stops_list.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/widgets/location_picked_card_info.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/widgets/selected_location_header.dart';

class SearchBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 65.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: controller?.locationPicked?.id == null
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SelectedLocationHeader(),
                      Helpers.verticalSpaceSmall(),
                      LocationPickedCardInfo(),
                      Helpers.verticalSpaceSmall(),
                      AssignedStopsHeader(),
                      Helpers.verticalSpaceSmall(),
                      AssignedStopsList(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
