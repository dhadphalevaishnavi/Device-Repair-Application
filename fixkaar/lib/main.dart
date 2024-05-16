import 'package:fixkaar/screens_and_widgets/screens/LoginScreen.dart';
import 'package:fixkaar/screens_and_widgets/screens/ProfileScreen.dart';
import 'package:fixkaar/screens_and_widgets/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return OKToast(
      child: MaterialApp(
        title: 'Fixkaar Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(232, 78, 54, 1.0)),
          useMaterial3: true,
        ),
        home:  const SplashScreen(),
      ),
    );
  }
}
