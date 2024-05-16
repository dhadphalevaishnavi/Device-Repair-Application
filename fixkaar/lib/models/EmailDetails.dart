import 'ContactDetails.dart';
import 'Email.dart';

class EmailDetails extends Email implements ContactDetails {
  @override
  bool verificationStatus;

  EmailDetails({required super.email, required this.verificationStatus});

  //convert data from json(map/key-value pair) to class object
  factory EmailDetails.fromJson(Map<String, dynamic> json) {
    return EmailDetails(
      email: json['email'],
      verificationStatus: json['verificationStatus'],
    );
  }

  //map class object to json(map/key-value pair)
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'verificationStatus': verificationStatus,
    };
  }
}
