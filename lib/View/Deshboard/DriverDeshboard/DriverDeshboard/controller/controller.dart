import 'package:driver_app_alpha/Component/Network/API.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:get/get.dart';

class Deshboard extends GetxController {
  RxBool LogoutLoader = false.obs;
DateTime? lastLogoutPress; // <-- New variable
logOutConfirmation() async {
  DateTime now = DateTime.now();

  if (lastLogoutPress == null ||
      now.difference(lastLogoutPress!) > Duration(seconds: 2)) {
    lastLogoutPress = now;
    Get.snackbar(
      "Logout",
      "Again tap to logout",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  } else {
    // Double press within 2 sec -> Logout
    await logOut();
  }
}

  logOut() async {
    LogoutLoader.value = true;
    var formData = {
    };
    var response = await Api().post(
      formData,
      "drivers/logout/${Api().sp.read('id')}",
      auth: true,
    );
    if (response.statusCode == 200) {
      Api().sp.erase();
        Get.offAllNamed(Routes.SelectCompany);
    print("Sending ID: ${Api().sp.read('id')}");
      print("Logout Success: ${response.data}");
    } else {
      print("Logout Failed: ${response.statusCode}");
    }
  }















}
