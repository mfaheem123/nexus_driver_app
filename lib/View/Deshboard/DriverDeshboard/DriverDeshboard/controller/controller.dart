import 'dart:async';

import 'package:driver_app_alpha/Component/Network/API.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/model/driver_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Deshboard extends GetxController {
  final timerController = Get.find<TimerController>();



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
        backgroundColor: Color.fromARGB(255, 91, 19, 128),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } else {
      await logOut();
      timerController.stopTimer();
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



class TimerController extends GetxController with WidgetsBindingObserver {
  var seconds = 0.obs;
  Timer? timer;
  final box = GetStorage();


  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);

    bool wasRunning = box.read("running") ?? false;

    int lastOpen = box.read("lastOpen") ?? 0;
    int now = DateTime.now().millisecondsSinceEpoch;

    // Agar app 15 seconds se zyada band rahi → RESET
    if (now - lastOpen > 1500) {
      seconds.value = 0;
      box.write("timer", 0);
    } else {
      seconds.value = box.read("timer") ?? 0;
    startTimer();
    }
    startTimer();
  }


  void startTimer() {
    timer?.cancel();
    box.write("running", true);   // IMPORTANT
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      seconds.value++;
      box.write("timer", seconds.value);
    });
  }


  void pauseTimer() {
    timer?.cancel();
  }

  void stopTimer() {
    timer?.cancel();
    seconds.value = 0;
    box.write("timer", 0);
    box.write("running", false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    // Jab app inactive ya paused ho (background me jaye)
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      pauseTimer();
      print("----------------------------------Paused/Inactive Timer");
    }

    // Jab app bilkul close hone ke qareeb ho (UI detach ho jaye)
    if (state == AppLifecycleState.detached) {
      stopTimer();
      print("----------------------------------Detached: Timer Stopped Completely");
    }

    // Jab app dubara active ho (foreground me aye)
    if (state == AppLifecycleState.resumed) {
      startTimer();
      print("-----------------------------------------------------Start Timer");
    }
  }

  @override
  void onClose() {
    // 🔥 App kill = RESET TIMER
    box.write("running", false);
    box.write("timer", 0);
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
