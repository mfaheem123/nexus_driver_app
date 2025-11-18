import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class UThemeData {
  UThemeData._();

  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    hintColor: Color(0xff462C87),
        canvasColor: Colors.white,
        focusColor: Color(0xff462C87),
    bannerTheme: MaterialBannerThemeData(backgroundColor: const   Color(0xff2A1655),) ,  
    cardColor: Colors.white,
    primaryColor:  const Color(0xff40158B),
    cardTheme: const CardThemeData(color: Color(0xff2A1655)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: const Color.fromARGB(255, 231, 231, 231),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    bannerTheme:        MaterialBannerThemeData(backgroundColor:  Color(0xff0F0F0F),) ,
    canvasColor: Color.fromARGB(255, 77, 68, 82),
    scaffoldBackgroundColor: Color(0xff0F0F0F),
    hintColor: Colors.white,
    primaryColor: Color.fromARGB(255, 50, 44, 53),
    focusColor: Color(0xff5A253F),
    cardColor: const Color.fromARGB(198, 24, 24, 26),
    cardTheme: CardThemeData(color: Color(0xff1E1E1E)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: const Color.fromARGB(255, 50, 44, 53),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}

class ThemeController extends GetxController {
  final _storage = GetStorage();
  var isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = _storage.read('isDarkTheme') ?? false;
  }

  void toggleTheme() {
    isDark.value = !isDark.value;
    _storage.write('isDarkTheme', isDark.value);
  }

  ThemeData get theme =>
      isDark.value ? UThemeData.darkTheme : UThemeData.lightTheme;
}


