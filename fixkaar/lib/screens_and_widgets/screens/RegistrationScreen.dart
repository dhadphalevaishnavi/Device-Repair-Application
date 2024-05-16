import 'package:fixkaar/models/LoginDetails.dart';
import 'package:fixkaar/screens_and_widgets/screens/LoginScreen.dart';
import 'package:fixkaar/services/TextFieldValidator.dart';
import 'package:fixkaar/services/UserService.dart';
import 'package:flutter/material.dart';

import '../../models/User.dart';
import '../widgets/AlertBoxWidgit.dart';
import '../widgets/TextFieldWidget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isTextFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Image.asset('images/register.jpg'),
                  Ink.image(
                    height: 280,
                    width: 280,
                    image: const AssetImage('images/register.jpg'),
                  ),

                  TextFieldWidget(
                    controller: firstNameController,
                    hintText: 'First Name',
                    icon: Icons.perm_identity,
                    validationFunction: TextFieldValidator.nameValidator,
                  ),
                  const SizedBox(height: 12),
                  TextFieldWidget(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    icon: Icons.perm_identity,
                    validationFunction: TextFieldValidator.nameValidator,
                  ),
                  const SizedBox(height: 12),
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
                  if (isTextFieldEmpty)
                    const Text(
                      'Enter all fields...',
                      style: TextStyle(color: Colors.red),
                    )
                  else
                    const SizedBox(
                      height: 20,
                    ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 35),
                    ),
                    onPressed: () => register(context),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () => goToLoginScreen(context),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  register(BuildContext context) {
    final String firstName = firstNameController.text;
    final String lastName = lastNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      setState(() {
        isTextFieldEmpty = true;
      });
    } else {
      final LoginDetails loginDetails =
          LoginDetails(password: password, email: email);

      User user = User(
          firstName: firstName, lastName: lastName, loginDetails: loginDetails);
      Map<String, dynamic> userMap = user.registrationDTOtoJson();

      UserService.registerUser(userMap).then((value) {
        if (value != null) {
          AlertBoxWidget.toast(value!, Colors.green.shade500);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      });
    }
  }

  goToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
