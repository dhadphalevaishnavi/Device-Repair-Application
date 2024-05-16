

import 'dart:ffi';

import 'package:fixkaar/models/ContactDetails.dart';

class MobileDetails implements ContactDetails{
  @override
  bool verificationStatus;
  final Long mobileNumber;

  MobileDetails({required this.mobileNumber , required this.verificationStatus});

  //convert data from json(map/key-value pair) to class object
  factory MobileDetails.fromJson(Map<String, dynamic> json) {
    return MobileDetails(
      mobileNumber: json['mobileNumber'],
      verificationStatus: json['verificationStatus'],
    );
  }

  //map class object to json(map/key-value pair)
  @override
  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'verificationStatus': verificationStatus,
    };
  }
}