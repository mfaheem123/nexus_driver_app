import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';


class MapControllerX extends GetxController {
  Rx<LatLng?> currentLatLng = Rx<LatLng?>(null);
  RxString locationText = "Fetching location...".obs;

  // 🔹 Drop-off marker
  Rx<LatLng?> dropOffLatLng = Rx<LatLng?>(null);

  // 🔹 Route polyline points
  RxList<LatLng> polylinePoints = <LatLng>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  /// ✅ Device ka current GPS location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationText.value = "Location services are disabled.";
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationText.value = "Location permissions are denied.";
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationText.value = "Location permissions are permanently denied.";
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    updateLocation(LatLng(position.latitude, position.longitude));
  }

  /// ✅ Pickup marker update
  Future<void> updateLocation(LatLng newLatLng) async {
    currentLatLng.value = newLatLng;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(newLatLng.latitude, newLatLng.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationText.value =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      } else {
        locationText.value =
            "Lat: ${newLatLng.latitude}, Lng: ${newLatLng.longitude}";
      }
    } catch (e) {
      locationText.value =
          "Lat: ${newLatLng.latitude}, Lng: ${newLatLng.longitude}";
    }
  }

  // /// ✅ Drop-off search by address
  // Future<void> searchDropOff(String address) async {
  //   try {
  //     List<Location> locations = await locationFromAddress(address);
  //     if (locations.isNotEmpty) {
  //       final drop = LatLng(locations.first.latitude, locations.first.longitude);
  //       dropOffLatLng.value = drop;
  //       updateRoute();
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Address not found");
  //   }
  // }

  /// ✅ Straight line route from pickup → drop-off
  void updateRoute() {
    if (currentLatLng.value != null && dropOffLatLng.value != null) {
      polylinePoints.clear();
      polylinePoints.add(currentLatLng.value!);
      polylinePoints.add(dropOffLatLng.value!);
    }
  }
}
