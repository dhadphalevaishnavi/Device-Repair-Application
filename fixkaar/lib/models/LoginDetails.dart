

import 'Email.dart';

class LoginDetails extends Email{

  final String password;

  LoginDetails({required this.password, required super.email, });

  //convert data from json(map/key-value pair) to class object
  factory LoginDetails.fromJson(Map<String, dynamic> json) {
    return LoginDetails(
      email: json['email'],
      password: json['password'],
    );
  }

  //map class object to json(map/key-value pair)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password':password,
    };
  }


}

