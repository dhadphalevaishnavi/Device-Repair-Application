import 'dart:core';

import 'package:email_validator/email_validator.dart';

class TextFieldValidator {
  static String emailFieldValidator(String? email) {
    if (email!.isEmpty) {
      return "Email can not be empty";
    }
    final bool isEmailValid = EmailValidator.validate(email);
    if (!isEmailValid) {
      return "Invalid email ID";
    }
    return '';
  }

  static String passwordValidator(String? password) {
    if (password!.isEmpty) {
      return "Password can not be empty";
    }
    if(password.length<4 || password.length>15){
      return "password should be 4 to 15 characters long";
    }
    return '';
  }

  static String nameValidator(String? name){

    if(name!.length<2 || name!.length>18){
      return "Name should be 2 to 18 characters long";
    }
    return '';
  }

}
