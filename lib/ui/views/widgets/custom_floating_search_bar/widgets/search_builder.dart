import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/globals/constants.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';

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
                        separatorBuilder: (BuildContext context, int index) =>
                            Helpers.verticalSpace(10.0),
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
                                                              ?.productClasses
                                                              ?.length ??
                                                          0,
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
