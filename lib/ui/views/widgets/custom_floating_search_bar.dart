import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
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
                  : ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Helpers.verticalSpace(10.0),
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        LocationsEntity location = controller.locations[index];
                        return InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            splashColor: Colors.black,
                            onTap: () async {
                              await controller.onLocationListItemTap(location);
                            },
                            child: Text(
                              location?.disassembledName ??
                                  location?.name ??
                                  '',
                              textAlign: TextAlign.center,
                            ));
                      },
                    ),
            ),
          );
        },
      );
    });
  }
}
