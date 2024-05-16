import 'dart:async';

import 'package:fixkaar/screens_and_widgets/screens/LoginScreen.dart';
import 'package:fixkaar/screens_and_widgets/screens/SelectDeviceTypeScreen.dart';
import 'package:fixkaar/services/LoginLogoutService.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return SplashScreenDisplay();
  }
}

class SplashScreenDisplay extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Widget screenToShow = const LoginScreen() ;
    LoginLogoutService.checkIfAlreadyLoggedIn().then((value) {
      if(value){

        LoginLogoutService.fetchUserFromPhoneMemory();
        screenToShow = const SelectDeviceTypeScreen();
      }
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => screenToShow ));
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 78, 54, 1.0),
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/logoWithTagline.jpeg'))),
        ),
      ),
    );
  }
}
