// ignore_for_file: prefer_const_constructors

import 'package:driver_app_alpha/View/Auth/LoginScreen.dart';
import 'package:driver_app_alpha/View/Auth/TokenScree.dart';
import 'package:driver_app_alpha/View/Auth/selectCompany.dart';
import 'package:driver_app_alpha/View/home/DriverDashboard.dart';
import 'package:driver_app_alpha/View/home/JobInvitationScreen.dart';
import 'package:driver_app_alpha/View/home/RideInfoScreen.dart';
import 'package:driver_app_alpha/View/home/Setting/list.dart';
import 'package:driver_app_alpha/View/home/booking.dart';
import 'package:driver_app_alpha/View/home/fareMeterScreen.dart';
import 'package:driver_app_alpha/View/home/jobAlert.dart';
import 'package:driver_app_alpha/View/home/jobDetailsScreen.dart';
import 'package:driver_app_alpha/View/home/notification.dart';
import 'package:driver_app_alpha/View/home/plotScreen.dart';
import 'package:driver_app_alpha/View/home/profileScreen.dart';
import 'package:get/get.dart';

import '../View/home/breakScreen.dart';
import '../View/home/showamount.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.driverDashboard;
  // static const initial = Routes.SelectCompany;

  static final routes = [
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
  ];
}
