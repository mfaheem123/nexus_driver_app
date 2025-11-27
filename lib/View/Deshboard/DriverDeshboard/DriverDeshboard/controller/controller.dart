import 'dart:async';

import 'package:driver_app_alpha/Component/Network/API.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/model/driver_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      await logOut();
    }
  }

  logOut() async {
    LogoutLoader.value = true;
    var formData = {};
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

  DriverDetailsModel? driverDetailsModel;
  RxBool getDriverLoader = false.obs;

  driverDetail() async {
    getDriverLoader(true);
    var response = await Api().get(
      'drivers/getbyid/${Api().sp.read('id')}',
      auth: true,
    );
    if (response.statusCode == 200) {
      driverDetailsModel = DriverDetailsModel.fromJson(response.data);
      getDriverLoader(false);
      update();
    }
  }
}
//
// class TimerController extends GetxController with WidgetsBindingObserver {
//   var seconds = 0.obs;
//   Timer? timer;
//   final box = GetStorage();
//
//   @override
//   void onInit() {
//     super.onInit();
//     WidgetsBinding.instance.addObserver(this);
//     seconds.value = 0;
//     box.remove("timer");
//     box.write("running", true);
//     startTimer();
//   }


//   void startTimer() {
//     timer?.cancel();
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       seconds.value++;
//       box.write("timer", seconds.value);
//     });
//   }
//
//   void resetTimer() {
//     seconds.value = 0;
//     box.remove("timer");
//   }
//
//   void pauseTimer() {
//     timer?.cancel();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused
//         ||  state == AppLifecycleState.inactive
//     ) {
//
//       resetTimer();
//       pauseTimer();
//       box.write("running", false);
//     }
//
//     if (state == AppLifecycleState.resumed) {
//       /// ✔ Back again → fresh session
//       box.write("running", true);
//       startTimer();
//     }
//   }
//
//   @override
//   void onClose() {
//     resetTimer();
//     pauseTimer();
//     box.write("running", false);
//     WidgetsBinding.instance.removeObserver(this);
//     super.onClose();
//   }
//
//   String formatTime(int sec) {
//     int hours = sec ~/ 3600;
//     int minutes = (sec % 3600) ~/ 60;
//     int secs = sec % 60;
//     return '${hours}hr , ${minutes} mins . ${secs} sec';
//   }
// }



class TimerController extends GetxController with WidgetsBindingObserver {
  var seconds = 0.obs;
  Timer? timer;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    bool wasRunning = box.read("running") ?? false;
    if (wasRunning) {
      seconds.value = box.read("timer") ?? 0;
    } else {
      seconds.value = 0;
      box.remove("timer");
    }
    box.write("running", true);
    startTimer();
  }


  void stopTimer() {
    timer?.cancel();
    seconds.value = 0;
    box.write("running", false);
    box.remove("timer");
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds.value++;
      box.write("timer", seconds.value);
    });
  }

  void pauseTimer() {
    timer?.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      /// Background ⇒ pause only
      pauseTimer();
      box.write("running", true); // still running session
    }
    if (state == AppLifecycleState.resumed) {
      /// Back to app ⇒ continue
      box.write("running", true);
      startTimer();
    }
  }

  @override
  void onClose() {
    /// App Kill ⇒ next time reset
    box.write("running", false);
    pauseTimer();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  String formatTime(int sec) {
    int hours = sec ~/ 3600;
    int minutes = (sec % 3600) ~/ 60;
    int secs = sec % 60;
    return '${hours}hr , ${minutes} mins . ${secs} sec';
  }
}
