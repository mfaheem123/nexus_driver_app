import 'package:driver_app_alpha/Controller/osm_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
class OpenStreetMapScreen extends StatelessWidget {
  OpenStreetMapScreen({super.key});

  final MapControllerX controller = Get.put(MapControllerX());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          // 🔹 Current pickup address row
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, top: 40),
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Row(
          //       children: [
          //         const Icon(Icons.location_on, color: Colors.red),
          //         const SizedBox(width: 15),
          //         Expanded(
          //           child: Obx(
          //             () => Text(
          //               controller.locationText.value,
          //               style: gilroyBold(
          //                 color: Colors.blue,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //               maxLines: 2,
          //               softWrap: true,
          //               overflow: TextOverflow.ellipsis,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 20),

          // 🔹 Drop-off input field
          // SizedBox(
          //   height: 50,
          //   width: width,
          //   child: CustomTextFieldDy(
          //     showBorder: false,
          //     hintText: "Drop off",
          //     prefixIcon: Icons.location_on,
          //     color: Colors.red,
          //     onSubmitted: (value) {
          //       controller.searchDropOff(value); // ✅ address → marker
          //     },
          //   ),
          // ),

          // const SizedBox(height: 10),

          // 🔹 Map area
          Expanded(
            child: Obx(() => controller.currentLatLng.value == null
                ? const Center(child: CircularProgressIndicator())
                : FlutterMap(
                    options: MapOptions(
                      initialCenter:
                          controller.currentLatLng.value ?? LatLng(24.8607, 67.0011),
                      initialZoom: 15,
                      onTap: (tapPos, point) {
                        controller.updateLocation(point); // ✅ pickup update
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),

                      // 🔹 Pickup + Drop-off markers
                      Obx(() => MarkerLayer(
                            markers: [
                              if (controller.currentLatLng.value != null)
                                Marker(
                                  point: controller.currentLatLng.value!,
                                  width: 80,
                                  height: 80,
                                  child: const Icon(Icons.my_location,
                                      color: Colors.blue, size: 35),
                                ),
                              if (controller.dropOffLatLng.value != null)
                                Marker(
                                  point: controller.dropOffLatLng.value!,
                                  width: 80,
                                  height: 80,
                                  child: const Icon(Icons.location_pin,
                                      color: Colors.red, size: 40),
                                ),
                            ],
                          )),

                      // 🔹 Route line
                      Obx(() => PolylineLayer(
                            polylines: [
                              if (controller.polylinePoints.isNotEmpty)
                                Polyline(
                                  points: controller.polylinePoints,
                                  strokeWidth: 4,
                                  color: Colors.blue,
                                ),
                            ],
                          )),
                    ],
                  )),
          ),
        ],
      ),
    );
  }
}
