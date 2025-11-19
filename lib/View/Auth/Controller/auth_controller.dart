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
    var data = {
      "username": DriverUserName.text,
      "password": DriverPassword.text,
    };
    ;
    var response = await Api().post(
      data,
      "",
      fullUrl: 'http://192.168.110.4:5000/api/drivers/login',

      auth: true,
    );

    if (response.statusCode == 200) {
      if (response != null && response.statusCode == 200) {
        // Save token
        Api().sp.write('token', response.data['token']);

        print("-----------------------User Login Sucessfull");
        print(response.data);
        Get.toNamed(Routes.tokenScreen);
      }
    } else {
      print("-----------------------------Login Failed");
    }
    PostAuthLoader.value = false;
  }


checkUserLogin() async {
  await Future.delayed(Duration(seconds: 2)); // optional splash delay

  var token = Api().sp.read('token');

  if (token != null && token != "") {
    Get.offAllNamed(Routes.driverDashboard);   // User already logged in
  } else {
    Get.offAllNamed(Routes.loginScreen);  // Go to login page
  }
}






}
