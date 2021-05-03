import 'package:flutter/material.dart';

class PopulateLocationTypeIcon extends StatelessWidget {
  final String type;

  PopulateLocationTypeIcon({
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'poi':
        return Icon(Icons.location_on_outlined);
      case 'street':
        return Icon(Icons.edit_road_sharp);
      case 'stop':
        return Icon(Icons.directions_train_sharp);
      case 'suburb':
        return Icon(Icons.home_work_sharp);
      default:
        return SizedBox();
    }
  }
}
