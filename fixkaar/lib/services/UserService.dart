import 'dart:convert';

import 'package:fixkaar/constants/ApiConstants.dart';
import 'package:fixkaar/models/DeviceServiceRequest.dart';
import 'package:fixkaar/models/User.dart';
import 'package:fixkaar/screens_and_widgets/widgets/AlertBoxWidgit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/ExtraConstants.dart';

class UserService {
  static Future<String?> registerUser(Map<String, dynamic> user) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.userEndpoint}/register");
      final response = await http.post(url,
          body: jsonEncode(user), headers: ApiConstants.contentTypeHeader);
      if (response.statusCode == 200) {
        //since response body is already in String format no need to convert in this case
        return response.body;
      } else {
        AlertBoxWidget.toast('Something went wrong while user registration!',
            Colors.red.shade500);
      }
    } catch (e) {
      AlertBoxWidget.toast(
          'Something went wrong while calling API  UserService.registerUser()',
          Colors.red.shade500);
      e.toString();
      // return '';
    }
  }

  static Future<User?> login(Map<String, dynamic> loginDetailsMap) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.userEndpoint}/login");
      final response = await http.post(url,
          body: jsonEncode(loginDetailsMap),
          headers: ApiConstants.contentTypeHeader);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final decodedResponseBody = jsonDecode(response.body);
          User user = User.loginDTOFromJson(decodedResponseBody);
          return user;
        }
      } else {
        AlertBoxWidget.toast(
            'Something went wrong while Login!', Colors.red.shade500);
      }
    } catch (e) {
      e.toString();
      AlertBoxWidget.toast(
          'Something went wrong while calling API  UserService.login()',
          Colors.red.shade500);
      return User();
    }
  }

  static Future<String?> requestDeviceRepairService() async {
    final deviceType1 = ExtraConstants.chosenDeviceType1;
    final deviceType2 = ExtraConstants.chosenDeviceType2;
    final brandName = ExtraConstants.brandName;
    final modelName = ExtraConstants.modelName;
    final email = ExtraConstants.userEmail;
    final baseUrl = ApiConstants.baseUrl;
    final userEndpoint = ApiConstants.userEndpoint;

    try {
      final url = Uri.parse(
          "$baseUrl$userEndpoint/request-repaire/$deviceType1/$deviceType2/$brandName/$modelName/$email");
      final response = await http.put(url);
      if (response.statusCode == 200) {
        final responseBody = response.body;
        return responseBody;
      } else {
        AlertBoxWidget.toast(
            'Something went wrong while requesting device repair service ! !',
            Colors.red.shade500);
      }
    } catch (e) {
      e.toString();
      AlertBoxWidget.toast(
          'Something went wrong while calling API  UserService.requestDeviceRepairService()',
          Colors.red.shade500);
    }
  }

  static Future<List<DeviceServiceRequest>?> getDeviceListOfUser(
      String email) async {
    try {
      final url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.userEndpoint}/getDeviceRepairRequestList/$email");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final decodedResponseBody =
              jsonDecode(response.body) as List<dynamic>;

          List<DeviceServiceRequest> deviceList = decodedResponseBody
              .map((e) => DeviceServiceRequest.fromJson(e))
              .toList();
          return deviceList;
        } else {
          AlertBoxWidget.toast(
              'No device service requests!', Colors.red.shade500);
        }
      } else {
        AlertBoxWidget.toast(
            'Something went wrong while fetching device service requests!',
            Colors.red.shade500);
      }
    } catch (e) {
      e.toString();
      AlertBoxWidget.toast(
          'Something went wrong while calling API UserService.getDeviceListOfUser()',
          Colors.red.shade500);
    }
  }
}
