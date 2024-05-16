import 'dart:convert';

import 'package:fixkaar/constants/ApiConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Brand.dart';
import '../models/Device.dart';
import '../models/Model.dart';
import '../screens_and_widgets/widgets/AlertBoxWidgit.dart';

class DeviceService {
  static Future<List<Device>?> getAllDevices() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.deviceEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseBody = response.body;
        var jsonDecodedBody = jsonDecode(responseBody) as List<dynamic>;

        List<Device> devices =
            jsonDecodedBody.map((e) => Device.fromJson(e)).toList();
        return devices;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get device by device_type depending on parameter passed {Mobile and Tablet} {Desktop and Laptop}
  static Future<List<Device>?> getDeviceByDeviceType(
      String deviceType1, String deviceType2) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.deviceEndpoint}/$deviceType2/$deviceType1");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = response.body;
        //responseBody is in String format. Convert it into JSON using jsonDecode
        final decodedResponseBody = jsonDecode(responseBody) as List<dynamic>;
        List<Device> devices =
            decodedResponseBody.map((e) => Device.fromJson(e)).toList();
        return devices;
      }
    } catch (e) {
      e.toString();
      AlertBoxWidget.toast(
          'Something went wrong while Calling API DeviceService.getDeviceByDeviceType()',
          Colors.red.shade500);
    }
  }

  //get Brand details by device_type depending on parameter passed {Mobile and Tablet} {Desktop and Laptop}
  static Future<List<Brand>?> getBrandsOfDeviceType(
      String deviceType1, String deviceType2) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.deviceEndpoint}/$deviceType1/$deviceType2");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedResponseBody = jsonDecode(responseBody) as List<dynamic>;
        List<Brand> brandList = decodedResponseBody
            .map((e) => Brand.brandNameAndImageDto(e))
            .toList();

        return brandList;
      }
    } catch (e) {
      AlertBoxWidget.toast(
          'Something went wrong while Calling API DeviceService.getBrandsOfDeviceType()',
          Colors.red.shade500);

      e.toString();
    }
  }

  static Future<List<Model>?> getModelByBrandAndDeviceType(
      String deviceType1, String deviceType2, String brandName) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.deviceEndpoint}/$deviceType1/$deviceType2/$brandName");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final decodedResponseBody = jsonDecode(responseBody) as List<dynamic>;
        List<Model> models =
            decodedResponseBody.map((e) => Model.fromJson(e)).toList();
        return models;
      }
    } catch (e) {
      AlertBoxWidget.toast(
          'Something went wrong while Calling API DeviceService.getModelByBrandAndDeviceType()',
          Colors.red.shade500);

      e.toString();
    }
  }
}
