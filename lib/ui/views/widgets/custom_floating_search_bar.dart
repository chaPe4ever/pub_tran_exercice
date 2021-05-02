import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/globals/constants.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';

class CustomFloatingSearchBar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;
      return FloatingSearchBar(
        hint: 'Stop, address or POI',
        controller: controller.customFloatingSearchBarController,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 500),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 250),
        progress: controller.isBusy,
        onQueryChanged: controller.onQueryChanged,
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: IgnorePointer(
              child: CircularButton(
                icon: const Icon(Icons.place),
                onPressed: () {},
              ),
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: controller.isBusy
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Helpers.verticalSpace(10.0),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.locations.length,
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: location?.inHistory ?? false
                                        ? Icon(Icons.history)
                                        : location.type == 'street' ||
                                                location.type == 'poi'
                                            ? Icon(Icons.location_on_outlined)
                                            : Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  GridView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      gridDelegate:
                                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                                              maxCrossAxisExtent:
                                                                  50,
                                                              childAspectRatio:
                                                                  3 / 2,
                                                              crossAxisSpacing:
                                                                  2,
                                                              mainAxisSpacing:
                                                                  2),
                                                      itemCount: location
                                                          .productClasses
                                                          .length,
                                                      itemBuilder:
                                                          (BuildContext ctx,
                                                              index) {
                                                        return Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              populateImageByPrdClass(
                                                                  index),
                                                        );
                                                      }),
                                                ],
                                              ),
                                  ),
                                ),
                                Helpers.horizontalSpace(10.0),
                                Flexible(
                                  flex: 8,
                                  child: Text(
                                    location?.disassembledName ??
                                        location?.name ??
                                        '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
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
        },
      );
    });
  }
}

Widget populateImageByPrdClass(int index) {
  double width = 22.0;
  double height = 22.0;
  switch (index) {
    case 1:
      return Image.asset(
        kSBahnIconAssetPath,
        width: width,
        height: height,
      );

    case 2:
      return Image.asset(
        kUBahnIconAssetPath,
        width: width,
        height: height,
      );
    case 4:
      return Image.asset(
        kTramIconAssetPath,
        width: width,
        height: height,
      );
    case 5:
    case 6:
      return Image.asset(
        kBusIconAssetPath,
        width: width,
        height: height,
      );
    default:
      return SizedBox();
  }
}
