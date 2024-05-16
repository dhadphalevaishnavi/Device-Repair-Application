import 'package:fixkaar/models/Model.dart';
import 'package:fixkaar/screens_and_widgets/screens/ProfileScreen.dart';
import 'package:fixkaar/screens_and_widgets/widgets/AlertBoxWidgit.dart';
import 'package:fixkaar/services/GoogleDriveImageConvertService.dart';
import 'package:fixkaar/services/UserService.dart';
import 'package:flutter/material.dart';

import '../../constants/ExtraConstants.dart';
import '../widgets/MenuWidget.dart';


class ShowModelDetailsScreen extends StatelessWidget {
  final String brandName = ExtraConstants.brandName;
  final String modelName = ExtraConstants.modelName;
  final String deviceType1 = ExtraConstants.chosenDeviceType1;
  final String deviceType2 = ExtraConstants.chosenDeviceType2;
  final Model model;

  ShowModelDetailsScreen({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(centerTitle:true, title: Text(
        "$brandName - $modelName",
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 20,
        ),
      ),),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card(
                  //     color: Colors.white,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           vertical: 10, horizontal: 105),
                  //       child: Text(
                  //         "$brandName - $modelName",
                  //         style: const TextStyle(
                  //           color: Colors.black54,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     )),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Ink.image(
                        height: 300,
                        width: 380,
                        image: NetworkImage(GoogleDriveImageConvertService
                            .editGoogleDriveImageLink(model.image))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'System Information',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: _customChip(model.os, 'OS'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 150,
                                    child: _customChip(model.ram!, 'RAM')),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 150,
                                    child: _customChip(
                                        model.processor, 'Processor')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => requestRepairService(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 35),
                    ),
                    child: const Text(
                      'Request Repairing Service',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //
    );
  }

  requestRepairService(BuildContext context) {
    //check if logged in else prompt to login
    if (ExtraConstants.userEmail.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => const AlertBoxWidget(),
          barrierDismissible: false);
    } else {
      //call api to add repair service in user
      UserService.requestDeviceRepairService().then((value) {
        AlertBoxWidget.toast(value!, Colors.green.shade500);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      });
    }
  }
}

Widget _customChip(String title, String subtitle) {
  return Chip(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      label: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ));
}
