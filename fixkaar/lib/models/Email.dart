class Email {
  final String email;

  Email({required this.email});

  // //convert data from json(map/key-value pair) to email object
  // factory Email.fromJson(Map<String, dynamic> json) {
  //   return Email(email: json['email']);
  // }
  //
  // //map Email object to json(map/key-value pair)
  // Map<String, dynamic> toJson() {
  //   return {
  //     'email': email,
  //   };
  // }
}
