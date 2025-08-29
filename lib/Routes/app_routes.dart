part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const loginScreen = _Paths.loginScreen;
  static const tokenScreen = _Paths.tokenScreen;
  static const SelectCompany = _Paths.SelectCompany;
  static const driverDashboard = _Paths.driverDashboard;
  static const jobInvitationScreen = _Paths.jobInvitationScreen;
  static const rideInfoScreen = _Paths.rideInfoScreen;
  static const jobDetailsScreen = _Paths.jobDetailsScreen;
  static const notificationsScreen = _Paths.notificationsScreen;
  static const fareMeterScreen = _Paths.fareMeterScreen;
  static const profileScreen = _Paths.profileScreen;
  static const ShowAmount = _Paths.ShowAmount;
  static const JobAlertScreen = _Paths.JobAlertScreen;
  static const BreakScreen = _Paths.BreakScreen;
}

abstract class _Paths {
  static const loginScreen = '/loginScreen';
  static const SelectCompany = '/SelectCompany';
  static const tokenScreen = '/tokenScreen';
  static const driverDashboard = '/driverDashboard';
  static const jobInvitationScreen = '/jobInvitationScreen';
  static const rideInfoScreen = '/rideInfoScreen';
  static const jobDetailsScreen = '/jobDetailsScreen';
  static const notificationsScreen = '/notificationsScreen';
  static const fareMeterScreen = '/fareMeterScreen';
  static const profileScreen = '/profileScreen';
  static const ShowAmount = '/ShowAmount';
  static const JobAlertScreen = '/JobAlertScreen';
  static const BreakScreen = '/BreakScreen';
}
