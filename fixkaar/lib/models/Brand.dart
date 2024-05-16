import 'package:fixkaar/models/DeviceDetails.dart';
import 'package:fixkaar/models/Model.dart';

class Brand extends DeviceDetails {
  final Model? model;

  Brand({
    required super.name,
    required super.image,
    this.model,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json["brandName"],
      image: json["brandImage"],
      model: Model.fromJson(json["model"]),
    );
  }

  factory Brand.brandNameAndImageDto(Map<String, dynamic> json) {
    return Brand(
      name: json["brandName"],
      image: json["brandImage"],
    );
  }
}
