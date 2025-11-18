import 'package:driver_app_alpha/Controller/osm_controller.dart';
import 'package:driver_app_alpha/View/Auth/Controller/auth_controller.dart';
import 'package:driver_app_alpha/theme/theme.dart';
import 'package:get/get.dart';



class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}




