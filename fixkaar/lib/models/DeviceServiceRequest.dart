

import 'Device.dart';

class DeviceServiceRequest {

  final Device device;
  final String serviceStatus;

  DeviceServiceRequest({required this.device, required this.serviceStatus});

  //convert data from json(map/key-value pair) to class object
  factory DeviceServiceRequest.fromJson(Map<String, dynamic> json) {
    return DeviceServiceRequest(
      device: Device.fromJson( json['device']),
      serviceStatus: json['serviceStatus'],
    );
  }

  //map class object to json(map/key-value pair)
  Map<String, dynamic> toJson() {
    return {
      'device': Device,
      'serviceStatus': serviceStatus,
    };
  }

}