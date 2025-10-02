import 'package:driver_app_alpha/Controller/osm_controller.dart';
import 'package:driver_app_alpha/theme/theme.dart';
import 'package:get/get.dart';

import '../View/Auth/AuthController.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}




