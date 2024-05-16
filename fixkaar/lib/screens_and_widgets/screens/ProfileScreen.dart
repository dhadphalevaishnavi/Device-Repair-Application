import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/screens_and_widgets/widgets/MenuWidget.dart';
import 'package:fixkaar/services/GoogleDriveImageConvertService.dart';
import 'package:fixkaar/services/UserService.dart';
import 'package:flutter/material.dart';

import '../../models/DeviceServiceRequest.dart';
import '../widgets/AlertBoxWidgit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<DeviceServiceRequest>? deviceList = [];
  bool isDeviceListEmpty = false;
  String firstName = '', lastName = '', email = '';

  @override
  void initState() {
    super.initState();

    UserService.getDeviceListOfUser(ExtraConstants.userEmail).then((value) {
      deviceList = value;
      if (deviceList == null) {
        isDeviceListEmpty = true;

        AlertBoxWidget.toast(
            'Brand List has returned null from backend', Colors.red.shade300);
      }
      setState(() {
        firstName = ExtraConstants.userFirstName;
        lastName = ExtraConstants.userLastName;
        email = ExtraConstants.userEmail;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuWidget(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "$firstName\'s Profile",
        ),
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('images/no-profile-picture.png'),
              ),
              Text(
                '$firstName $lastName',
                style: const TextStyle(fontSize: 20, color: Colors.deepPurple),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 15, color: Colors.deepPurple),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const Text(
                "Device Repair Requests",
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              if (!isDeviceListEmpty)
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: deviceList!.length,
                      itemBuilder: (context, index) {
                        return _tileListWidget(deviceList![index]);
                      }),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'You don\'t have any Device repaire requests yet!',
                    style: TextStyle(fontSize: 20, color: Colors.red.shade500),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tileListWidget(DeviceServiceRequest deviceItem) {
  final imageUrl = GoogleDriveImageConvertService.editGoogleDriveImageLink(
      deviceItem.device.brand.model!.image);
  final serviceStatus = deviceItem.serviceStatus;
  return Card(
    elevation: 10,
    margin: const EdgeInsets.all(12),
    child: ListTile(
      title: Text(
          '${deviceItem.device.brand.name} : ${deviceItem.device.brand.model!.name}'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 35,
      ),
      subtitle: Row(
        children: [
          Text('Status : '),
          Text(
            serviceStatus,
            style: serviceStatus == 'Incomplete'
                ? TextStyle(color: Colors.red.shade500)
                : TextStyle(color: Colors.green.shade500),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.delete_rounded),
      ),
    ),
  );
}
