import 'package:fixkaar/models/DeviceDetails.dart';

class Model extends DeviceDetails {
  final String os;
  final String processor;
  final String? ram;

  Model({
    required super.name,
    required super.image,
    required this.os,
    required this.processor,
    this.ram,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      name: json["modelName"],
      image: json["modelImage"],
      os: json["os"],
      processor: json["processor"],
      ram: json["ram"],
    );
  }
}
