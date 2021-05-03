import 'package:flutter/material.dart';
import 'package:pub_tran_exercise/globals/constants.dart';

class PopulateImageByProductClass extends StatelessWidget {
  final int index;
  final double width;
  final double height;
  PopulateImageByProductClass({
    @required this.index,
    this.width = 16.0,
    this.height = 16.0,
  });

  @override
  Widget build(BuildContext context) {
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
}
