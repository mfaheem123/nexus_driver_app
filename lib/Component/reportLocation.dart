// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:map_location_picker/map_location_picker.dart';
//
// import '../View/home/Controller/homeController.dart';
// import 'color.dart';
//
// class ReportLocation extends StatefulWidget {
//   ReportLocation({Key? key}) : super(key: key);
//
//   @override
//   State<ReportLocation> createState() => _ReportLocationState();
// }
//
// class _ReportLocationState extends State<ReportLocation> {
//   HomeController controller = Get.find();
//
//   String? address;
//   String? defaultAddress;
//   String? latitude;
//   String? longitude;
//
//   // String type = Get.arguments["locationType"];
//   @override
//   Widget build(BuildContext context) {
//     return MapLocationPicker(
//       currentLatLng: LatLng(40.730610, -73.935242),
//       minMaxZoomPreference: MinMaxZoomPreference(0, 16),
//       hideBackButton: true,
//       topCardColor: DynamicColors.whiteColor,
//       bottomCardColor: DynamicColors.whiteColor,
//       backButton: IconButton(
//         onPressed: () {
//           Get.back();
//         },
//         icon: Icon(
//           Icons.arrow_back_ios_sharp,
//           color: DynamicColors.dividerColor,
//         ),
//       ),
//       apiKey: "AIzaSyC_-hLFYGAJC_IBMnFBKZLq2IS1qr7tJgQ",
//       onNext: (GeocodingResult? result) {
//         if (result != null) {
//           // controller.location.value.text = result.formattedAddress ?? "";
//           // controller.latitude = result.geometry.location.lat;
//           // controller.longitude = result.geometry.location.lng;
//
//           controller.jobLocation.value.text = result.formattedAddress ?? "";
//           controller.latitude = result.geometry.location.lat;
//           controller.longitude = result.geometry.location.lng;
//         }
//       },
//       onSuggestionSelected: (PlacesDetailsResponse? result) {
//         controller.location.value.text = result!.result.formattedAddress ?? "";
//         controller.latitude = result.result.geometry!.location.lat;
//         controller.longitude = result.result.geometry!.location.lng;
//       },
//     );
//   }
// }
