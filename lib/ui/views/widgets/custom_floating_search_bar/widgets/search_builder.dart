import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/assets/my_app_theme.dart';
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
                                  child: Container(
                                    child: location?.inHistory ?? false
                                        ? Icon(Icons.history)
                                        : location.type == 'street' ||
                                                location.type == 'poi'
                                            ? Align(
                                                alignment: Alignment.centerLeft,
                                                child: Icon(
                                                    Icons.location_on_outlined))
                                            : location.type == 'suburb'
                                                ? Icon(Icons.home_work_sharp)
                                                : Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      GridView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              ClampingScrollPhysics(),
                                                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                                              maxCrossAxisExtent:
                                                                  20,
                                                              childAspectRatio:
                                                                  1.0,
                                                              crossAxisSpacing:
                                                                  4,
                                                              mainAxisSpacing:
                                                                  4),
                                                          itemCount: location
                                                                  ?.productClasses
                                                                  ?.length ??
                                                              0,
                                                          itemBuilder:
                                                              (BuildContext ctx,
                                                                  index) {
                                                            return Container(
                                                              // color:
                                                              //     Colors.green,
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
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        location?.disassembledName ??
                                            location?.name ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Get
                                            .theme.textTheme.disassembledNameTS,
                                      ),
                                      Helpers.verticalSpace(3.0),
                                      location?.parent?.name != null
                                          ? Text(
                                              location.parent.name,
                                              textAlign: TextAlign.start,
                                              style: Get.theme.textTheme
                                                  .locParentNameTS,
                                            )
                                          : SizedBox(),
                                    ],
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
  double width = 16.0;
  double height = 16.0;
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
    // case 5:
    case 6:
      return Image.asset(
        kBusIconAssetPath,
        width: width,
        height: height,
      );
    default:
      return Icon(
        Icons.not_listed_location_outlined,
        size: width + 6.0,
      );
  }
}
