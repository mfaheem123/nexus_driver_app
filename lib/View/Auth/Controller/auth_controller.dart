import 'dart:io';

import 'package:driver_app_alpha/Component/Network/API.dart';
import 'package:driver_app_alpha/Component/Network/errorMethod.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController DriverUserName = TextEditingController();
  TextEditingController DriverPassword = TextEditingController();
  RxBool PostAuthLoader = false.obs;
  authApi() async {
    PostAuthLoader.value = true;
    var formData = {
      "username": DriverUserName.text,
      "password": DriverPassword.text,
    };
    var response = await Api().post(
      formData,
      "",
      fullUrl: 'http://192.168.110.4:5000/api/drivers/login',
      auth: false,
    );
    if (response.statusCode == 200) {
      Api().sp.write('token', response.data['token']);
      Api().sp.write('id', response.data['driver']['id']);
      print("-----------------------User Login Sucessfull");
      print(response.data);
      Get.toNamed(Routes.tokenScreen);
    } else {
      print("-----------------------------Login Failed");
    }
    PostAuthLoader.value = false;
  }

  checkUserLogin() async {
    await Future.delayed(Duration(seconds: 2)); // optional splash delay
    var token = Api().sp.read('token');
    if (token != null && token != "") {
      Get.offAllNamed(Routes.driverDashboard); // User already logged in
    } else {
      Get.offAllNamed(Routes.loginScreen); // Go to login page
    }
  }

  TextEditingController nTG = TextEditingController();
  RxBool NTGLoad = false.obs;
  verifyNTG() async {
    NTGLoad.value = true;
    var formData = {"driver_access_token": nTG.text, "id": Api().sp.read("id")};
    print("Sending ID: ${Api().sp.read('id')}");

    var response = await Api().post(
      formData,
      "",
      fullUrl: 'http://192.168.110.4:5000/api/drivers/verifytoken',
      auth: true,
    );

    if (response.statusCode == 200) {
      Get.toNamed(Routes.driverDashboard);
      print("-----------------------NTG Okay");
    } else {
      print("-----------------------------NTG Failed");
    }
    NTGLoad.value = false;
  }
}
