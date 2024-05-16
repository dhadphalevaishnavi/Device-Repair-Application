import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/screens_and_widgets/widgets/BrandAndModelViewWidget.dart';
import 'package:fixkaar/services/DeviceService.dart';
import 'package:flutter/material.dart';

import '../../models/Model.dart';
import '../widgets/AlertBoxWidgit.dart';
import '../widgets/MenuWidget.dart';

class ShowModelScreen extends StatefulWidget {
  final String deviceType1 = ExtraConstants.chosenDeviceType1;
  final String deviceType2 = ExtraConstants.chosenDeviceType2;
  final String brandName = ExtraConstants.brandName;
  final String appBarTitle = ExtraConstants.modelScreenAppBarTitle;

  ShowModelScreen({
    super.key,
  });

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  List<Model>? modelList = [];

  @override
  void initState() {
    super.initState();
    DeviceService.getModelByBrandAndDeviceType(
            widget.deviceType1, widget.deviceType2, widget.brandName)
        .then((value) {
      if (value != null) {
        setState(() {
          modelList = value;
        });
      } else {
        AlertBoxWidget.toast(
            'Model List has returned null from backend', Colors.red.shade500);
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
        brandOrModelList: modelList,
        screenAppbarTitle: widget.appBarTitle,
        modelList: modelList,
      ),
    );
  }
}
