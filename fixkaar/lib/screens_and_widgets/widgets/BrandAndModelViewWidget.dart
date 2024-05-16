import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/models/Model.dart';
import 'package:flutter/material.dart';

import '../../models/DeviceDetails.dart';
import '../../services/GoogleDriveImageConvertService.dart';
import '../screens/ShowModelDetailsScreen.dart';
import '../screens/ShowModelScreen.dart';
import 'CardWidget.dart';

class BrandAndModelViewWidget extends StatelessWidget {
  final List<DeviceDetails>? brandOrModelList;
  final List<Model>? modelList;
  final String screenAppbarTitle;

  const BrandAndModelViewWidget({
    super.key,
    required this.brandOrModelList,
    required this.screenAppbarTitle,
    this.modelList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          String? imageLink = brandOrModelList![index].image;
          String? brandOrModelName = brandOrModelList![index].name;
          return InkWell(
            onTap: () => goToModelScreen(context, index),
            child: CardWidget(
              brandOrModelName: brandOrModelName,
              iconUrl: GoogleDriveImageConvertService.editGoogleDriveImageLink(
                  imageLink),
            ),
          );
        },
        itemCount: brandOrModelList!.length,
      ),
    );
  }

  goToModelScreen(BuildContext context, int index) {
    //find which Screen we are on
    //then Navigate accordingly
    //if we are on Brand Screen then Navigate to ShowModelScreen
    if (screenAppbarTitle == ExtraConstants.brandScreenAppbarTitle) {
      ExtraConstants.brandName = brandOrModelList![index].name;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShowModelScreen()));
    }
    //if we are on Model Screen then Navigate to ShowModelDetailsScreen
    else {
      ExtraConstants.modelName = brandOrModelList![index].name;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShowModelDetailsScreen(model : modelList![index])));
    }
  }
}
