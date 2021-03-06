import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/globals/constants.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/search_body.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_builder/search_builder.dart';

class CustomFloatingSearchBar extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;
      return FloatingSearchBar(
        key: Key(kFloatingSearchBarKey),
        hint: 'Stop, address or POI',
        controller: controller.customFloatingSearchBarController,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: Get.context.width, // isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
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
          return SearchBuilder();
        },
        body: SearchBody(),
      );
    });
  }
}
