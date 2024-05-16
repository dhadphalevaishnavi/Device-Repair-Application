import 'package:fixkaar/constants/ExtraConstants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens_and_widgets/widgets/AlertBoxWidgit.dart';

class LoginLogoutService {
  static login(String firstName, String lastName, String email) {
    ExtraConstants.userEmail = email;
    ExtraConstants.userLastName = lastName;
    ExtraConstants.userFirstName = firstName;

    saveUserInPhoneMemory(firstName, lastName, email);

    AlertBoxWidget.toast('Logged in!', Colors.green.shade500);
  }

  static logout() async {
    ExtraConstants.userEmail = '';
    ExtraConstants.userLastName = '';
    ExtraConstants.userFirstName = '';

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    AlertBoxWidget.toast('Logged out!', Colors.red.shade500);
  }

  static saveUserInPhoneMemory(
      String firstName, String lastName, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('firstName', firstName);
    sharedPreferences.setString('lastName', lastName);
    sharedPreferences.setString('email', email);
  }

  static Future<bool> checkIfAlreadyLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? email = sharedPreferences.getString('email');

    return email == null ? false : true;
  }

  static fetchUserFromPhoneMemory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    ExtraConstants.userEmail = sharedPreferences.getString('email')!;
    ExtraConstants.userLastName = sharedPreferences.getString('lastName')!;
    ExtraConstants.userFirstName = sharedPreferences.getString('firstName')!;
  }
}
