import 'package:fixkaar/screens_and_widgets/screens/RegistrationScreen.dart';
import 'package:fixkaar/services/LoginLogoutService.dart';
import 'package:fixkaar/services/TextFieldValidator.dart';
import 'package:fixkaar/services/UserService.dart';
import 'package:flutter/material.dart';

import '../../models/LoginDetails.dart';
import '../../models/User.dart';
import '../widgets/AlertBoxWidgit.dart';
import '../widgets/TextFieldWidget.dart';
import 'SelectDeviceTypeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool badCredentials = false;
  bool isTextFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Ink.image(
                    height: 300,
                    width: 300,
                    image: const AssetImage('images/Login.png'),
                  ),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.attach_email_outlined,
                    validationFunction: TextFieldValidator.emailFieldValidator,
                  ),
                  const SizedBox(height: 12),
                  TextFieldWidget(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.password_sharp,
                    validationFunction: TextFieldValidator.passwordValidator,
                  ),
                  const SizedBox(height: 12),
                  if (badCredentials)
                    const Text(
                      'Wrong Email or Password...',
                      style: TextStyle(color: Colors.red),
                    )
                  else if (isTextFieldEmpty)
                    const Text(
                      'Enter all fields...',
                      style: TextStyle(color: Colors.red),
                    )
                  else
                    const SizedBox(
                      height: 20,
                    ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                        ),
                        onPressed: () => login(context),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () =>
                            changeScreen(context, const RegistrationScreen()),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () =>
                        changeScreen(context, const SelectDeviceTypeScreen()),
                    child: const Text(
                      'Skip login',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomNavBarNew(),
    );
  }

  login(BuildContext context) {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        isTextFieldEmpty = true;
        badCredentials = false;
      });
    } else {
      final LoginDetails loginDetails =
          LoginDetails(password: password, email: email);
      final Map<String, dynamic> loginDetailsMap = loginDetails.toJson();

      UserService.login(loginDetailsMap).then((value) {
        if (value == null) {
          setState(() {
            badCredentials = true;
            isTextFieldEmpty = false;
            AlertBoxWidget.toast(
                'Wrong Email or Password!', Colors.red.shade500);
          });
        } else {
          User user = value;

          if (user.firstName != null) {
            LoginLogoutService.login(user.firstName!, user.lastName!, email);

            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              changeScreen(context, const SelectDeviceTypeScreen());
            }
          }
        }
      });
    }
  }

  void changeScreen(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }
}
