import 'Brand.dart';

class Device {
  final String id;
  final String deviceType;
  final Brand brand;

  Device({
    required this.id,
    required this.deviceType,
    required this.brand,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json["id"],
      deviceType: json["deviceType"],
      brand: Brand.fromJson(json["brand"]),
    );
  }


}
