import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/screens_and_widgets/widgets/AlertBoxWidgit.dart';
import 'package:fixkaar/screens_and_widgets/widgets/BrandAndModelViewWidget.dart';
import 'package:fixkaar/screens_and_widgets/widgets/MenuWidget.dart';
import 'package:fixkaar/services/DeviceService.dart';
import 'package:flutter/material.dart';

import '../../models/Brand.dart';
import '../../models/DeviceDetails.dart';

class ShowBrandScreen extends StatefulWidget {
  final String deviceType1 = ExtraConstants.chosenDeviceType1;
  final String deviceType2 = ExtraConstants.chosenDeviceType2;
  final String appBarTitle = ExtraConstants.brandScreenAppbarTitle;

  ShowBrandScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return ShowBrandScreenState();
  }
}

class ShowBrandScreenState extends State<ShowBrandScreen> {
  List<Brand>? brandList = [];

  @override
  void initState() {
    super.initState();

    DeviceService.getBrandsOfDeviceType(widget.deviceType1, widget.deviceType2)
        .then((value) {
      if (value != null) {
        setState(() {
          brandList = value;
        });
      } else {
        AlertBoxWidget.toast(
            'Brand List has returned null from backend', Colors.red.shade500);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuWidget(),
        appBar: AppBar(
          title: Text(widget.appBarTitle),
          elevation: 2,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_sharp),
            ),
          ],
        ),
        body: BrandAndModelViewWidget(
          brandOrModelList: brandList,
          screenAppbarTitle: widget.appBarTitle,
        ));
  }
}
