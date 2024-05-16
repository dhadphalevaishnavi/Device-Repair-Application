
abstract class ContactDetails {
  bool verificationStatus = false;

  ContactDetails({ required this.verificationStatus});


  Map<String,dynamic> toJson(){
    return {
      'verificationStatus': verificationStatus,
    };
  }

}
