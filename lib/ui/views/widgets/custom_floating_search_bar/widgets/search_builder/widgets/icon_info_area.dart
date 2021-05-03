import 'package:flutter/material.dart';
import 'package:pub_tran_exercise/core/models/locations_entity.dart';
import 'package:pub_tran_exercise/ui/shared_widgets/populate_image_by_product_class.dart';

class IconInfoArea extends StatelessWidget {
  final LocationsEntity location;

  IconInfoArea({
    @required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: location?.inHistory ?? false
          ? Icon(Icons.history)
          : location.type == 'street' || location.type == 'poi'
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
                            itemCount: location?.productClasses?.length ?? 0,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                // color:
                                //     Colors.green,
                                child:
                                    PopulateImageByProductClass(index: index),
                              );
                            }),
                      ],
                    ),
    );
  }
}
