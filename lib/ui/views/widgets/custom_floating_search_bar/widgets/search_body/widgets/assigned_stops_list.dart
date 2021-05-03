import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_tran_exercise/core/controllers/home_controller.dart';
import 'package:pub_tran_exercise/globals/helpers.dart';
import 'package:pub_tran_exercise/ui/shared_widgets/populate_image_by_product_class.dart';

class AssignedStopsList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext buildContext, int index) {
        var assignedStops = controller?.locationPicked?.assignedStops;
        var location = controller?.locationPicked;
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: location.type == 'street' || location.type == 'poi'
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.location_on_outlined))
                    : location.type == 'suburb'
                        ? Icon(Icons.home_work_sharp)
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GridView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 20,
                                          childAspectRatio: 1.0,
                                          crossAxisSpacing: 4,
                                          mainAxisSpacing: 4),
                                  itemCount:
                                      location?.productClasses?.length ?? 0,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      // color:
                                      //     Colors.green,
                                      child: PopulateImageByProductClass(
                                          index: index),
                                    );
                                  }),
                            ],
                          ),
              ),
            ),
            Helpers.horizontalSpace(10.0),
            Expanded(
              flex: 7,
              child: Container(
                child: Text(
                  assignedStops[index].name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1.0,
        );
      },
      itemCount: controller?.locationPicked?.assignedStops?.length ?? 0,
    );
  }
}
