import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:fixkaar/screens_and_widgets/screens/LoginScreen.dart';
import 'package:fixkaar/screens_and_widgets/screens/ProfileScreen.dart';
import 'package:fixkaar/screens_and_widgets/screens/SelectDeviceTypeScreen.dart';
import 'package:fixkaar/services/LoginLogoutService.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [buildMenuItems(context)],
          ),
        ),
      ),
    );
  }
}

Widget buildMenuItems(BuildContext context) {
  return Wrap(
    runSpacing: 15,
         alignment : WrapAlignment.center,
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home Page'),
        onTap: () => changeScreen(context, const SelectDeviceTypeScreen()),
      ),
      if (ExtraConstants.userEmail.isNotEmpty)
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () => changeScreen(context, const ProfileScreen())),
      const Divider(),
      if (ExtraConstants.userEmail.isEmpty)
        ElevatedButton(
          onPressed: () => changeScreen(context, const LoginScreen()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade400,
            elevation: 10,
            minimumSize: const Size(250, 50),
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      if (ExtraConstants.userEmail.isNotEmpty)
        ElevatedButton(
          onPressed: () {
            LoginLogoutService.logout();
            changeScreen(context, const LoginScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade400,
            elevation: 10,
            minimumSize: const Size(250, 50),
          ),
          child:  const Text(
            "Logout",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
    ],
  );
}

changeScreen(BuildContext context, Widget widget) {
  Navigator.pop(context);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
