

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';





class BrightnessController extends GetxController{

RxDouble brightness = 0.5.obs;

setbrightness(double value){
  brightness.value = value;

}





}


