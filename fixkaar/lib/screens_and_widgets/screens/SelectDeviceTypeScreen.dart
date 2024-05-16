import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/screens_and_widgets/screens/ShowBrandScreen.dart';
import 'package:fixkaar/screens_and_widgets/widgets/MenuWidget.dart';
import 'package:flutter/material.dart';

class SelectDeviceTypeScreen extends StatelessWidget {
  const SelectDeviceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer: const MenuWidget(),


      appBar: AppBar(
        title: const Text(
          'Choose Service',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            _ChoiceCard(
                imageWidth: 150,
                heading: 'Mobile & Tablet',
                subheading: 'Repair your Mobile and Tablet devices near you!',
                imagePath: 'images/mobile.png'),
            _ChoiceCard(
              imageWidth: 210,
              heading: 'Laptop & Desktop',
              subheading: 'Repair Laptop and Desktop near you!',
              imagePath: 'images/laptop.png',
            ),
            // Align(
            //   alignment:Alignment.bottomRight,
            //   child: FloatingActionButton(
            //     elevation: 35,
            //       onPressed: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => SelectDeviceTypeScreen())), child: Icon(Icons.home),),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  final String heading;
  final String subheading;
  final String imagePath;
  final double imageWidth;

  const _ChoiceCard({
    required this.heading,
    required this.subheading,
    required this.imagePath,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToShowServiceProviderPage(context),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(heading,
                          style: const TextStyle(
                            fontSize: 22,
                          )),
                      subtitle: Text(subheading,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          )),
                    ),
                  ],
                ),
              ), //description partition

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 230,
                      width: imageWidth,
                      child: Ink.image(
                        image: AssetImage(imagePath),
                      ),
                    ),
                  ),
                ],
              ), //image partition
            ],
          ),
        ),
      ),
    );
  }

  goToShowServiceProviderPage(BuildContext context) {
    List<String> deviceTypeList = heading.split("&");
    ExtraConstants.chosenDeviceType1 = deviceTypeList[0].replaceAll(' ', '');
    ExtraConstants.chosenDeviceType2 = deviceTypeList[1].replaceAll(' ', '');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShowBrandScreen()));
  }
}
