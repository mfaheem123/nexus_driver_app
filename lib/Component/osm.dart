import 'package:driver_app_alpha/Controller/osm_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapScreen extends StatelessWidget {
  OpenStreetMapScreen({super.key});

  final MapControllerX controller = Get.find<MapControllerX>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.currentLatLng.value == null
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
                MarkerLayer(
                  markers: [
                    if (controller.currentLatLng.value != null)
                      Marker(
                        point: controller.currentLatLng.value!,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    if (controller.dropOffLatLng.value != null)
                      Marker(
                        point: controller.dropOffLatLng.value!,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                  ],
                ),

                // 🔹 Route line
                PolylineLayer(
                  polylines: [
                    if (controller.polylinePoints.isNotEmpty)
                      Polyline(
                        points: controller.polylinePoints,
                        strokeWidth: 4,
                        color: Colors.blue,
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}
