import 'package:fixkaar/models/EmailDetails.dart';
import 'package:fixkaar/models/MobileDetails.dart';

import 'ContactDetails.dart';
import 'DeviceServiceRequest.dart';
import 'LoginDetails.dart';

class User {
  final String? firstName;
  final String? lastName;
  final LoginDetails? loginDetails;
  final ContactDetails? emailDetails;
  final ContactDetails? mobileDetails;
  final List<DeviceServiceRequest>? repairServiceRequests;

  User({
    this.firstName,
    this.lastName,
    this.loginDetails,
    this.emailDetails,
    this.mobileDetails,
    this.repairServiceRequests,
  });

  //convert data from json(map/key-value pair) to class object
  factory User.fromJson(Map<String, dynamic> json) {
    // store List of DeviceServiceRequest in variable repairServiceRequestList
    final repairServiceRequestList =
        json['repairServiceRequests'] as List<dynamic>;

    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      loginDetails: LoginDetails.fromJson(json['loginDetails']),
      emailDetails: EmailDetails.fromJson(json['emailDetails']),
      mobileDetails: MobileDetails.fromJson(json['mobileDetails']),

      // use list variable which we declared above
      repairServiceRequests: repairServiceRequestList
          .map((e) => DeviceServiceRequest.fromJson(e))
          .toList(),
    );
  }

//map class object to json(map/key-value pair)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'loginDetails': loginDetails?.toJson(),
      'emailDetails': emailDetails?.toJson(),
      'mobileDetails': mobileDetails?.toJson(),
      'repairServiceRequests':
          repairServiceRequests?.map((e) => e.toJson()).toList(),
    };
  }

  factory User.registrationDTOFromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      loginDetails: LoginDetails.fromJson(json['loginDetails']),
    );
  }

  Map<String, dynamic> registrationDTOtoJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'loginDetails': loginDetails?.toJson(),
    };
  }

  factory User.loginDTOFromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }


}
