import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_builder/widgets/icon_info_area.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_builder/widgets/location_info_area.dart';

class SearchBuilder extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller.locations.length == 0
        ? SizedBox()
        : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: controller.isBusy
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            thickness: 1.0,
                          );
                        },
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller?.locations?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          LocationsEntity location =
                              controller.locations[index];
                          return InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            splashColor: Colors.black,
                            onTap: () async {
                              await controller.onLocationListItemTap(location);
                            },
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: IconInfoArea(
                                    location: location,
                                  ),
                                ),
                                Helpers.horizontalSpace(10.0),
                                Expanded(
                                  flex: 7,
                                  child: LocationInfoArea(
                                    location: location,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),
          );
  }
}
