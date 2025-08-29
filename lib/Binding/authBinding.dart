import 'package:get/get.dart';

import '../View/Auth/AuthController.dart';


class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
