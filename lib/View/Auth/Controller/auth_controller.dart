import 'package:driver_app_alpha/Component/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController DriverUserName = TextEditingController();
  TextEditingController DriverPassword = TextEditingController();

  authApi() async {
    var formData = {};
    var response = await API().postApi(formData, "url");
  }
}
