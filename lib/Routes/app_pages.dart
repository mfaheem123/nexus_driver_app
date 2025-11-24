import 'package:driver_app_alpha/View/Auth/Controller/auth_controller.dart';
import 'package:driver_app_alpha/View/Auth/LoginScreen.dart';
import 'package:driver_app_alpha/View/Auth/TokenScree.dart';
import 'package:driver_app_alpha/View/Auth/selectCompany.dart';
import 'package:driver_app_alpha/View/Deshboard/BottomScreens/Job/JobInvitationScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/BottomScreens/Job/jobAlert.dart';
import 'package:driver_app_alpha/View/Deshboard/BottomScreens/Job/jobDetailsScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/BottomScreens/ProfileScreen/profileScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Home/booking.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/FareMeter/ShowAmount/showamount.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/FareMeter/fareMeterScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/BreakScreen/breakScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/DriverDashboard.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/notification.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Message/message.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/PlotScreen/plotScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Setting/BookingList/list.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/FareMeter/RideInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();


  static const initial = Routes.initial;
  // static const initial = Routes.rideInfoScreen;

  static final routes = [

    GetPage(
  name: Routes.initial,
  page: () => Container(), // blank, invisible
  middlewares: [AuthMiddleware()],
),
    GetPage(name: _Paths.loginScreen, page: () => LoginScreen()),
    GetPage(name: _Paths.tokenScreen, page: () => TokenScreen()),
    GetPage(name: _Paths.SelectCompany, page: () => SelectCompany()),
    GetPage(name: _Paths.BreakScreen, page: () => BreakScreen()),
    GetPage(name: _Paths.JobAlertScreen, page: () => JobAlertScreen()),
    GetPage(name: _Paths.driverDashboard, page: () => DriverDashboard()),
    GetPage(
      name: _Paths.jobInvitationScreen,
      page: () => JobInvitationScreen(),
    ),
    GetPage(name: _Paths.rideInfoScreen, page: () => RideInfoScreen()),
    GetPage(name: _Paths.jobDetailsScreen, page: () => JobDetailsScreen()),
    GetPage(
      name: _Paths.notificationsScreen,
      page: () => NotificationsScreen(),
    ),
    GetPage(name: _Paths.fareMeterScreen, page: () => FareMeterScreen()),
    GetPage(name: _Paths.profileScreen, page: () => ProfileScreen()),
    GetPage(name: _Paths.ShowAmount, page: () => ShowAmount()),
    GetPage(name: _Paths.BookingScreen, page: () => Booking_Screen()),
    GetPage(name: _Paths.SettingsScreen, page: () => SettingsScreen()),
    GetPage(name: _Paths.PlotScreen, page: () => PlotScreen()),
    GetPage(
      name: _Paths.DeshBoardMessageScreen,
      page: () => DeshBoardMessageScreen(),
    ),
  ];
}
