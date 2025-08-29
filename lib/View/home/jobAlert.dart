
import 'dart:async';
import 'dart:convert';
import 'package:driver_app/Routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class JobAlertScreen extends StatefulWidget {



  @override
  State<JobAlertScreen> createState() => _JobAlertScreenState();
}

class _JobAlertScreenState extends State<JobAlertScreen> {
  int _secondsRemaining = 60;
  bool? _isCountdownRunning;
  int jobs = 0;
  double fares = 0.0;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();

  }














  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor:Color(0xffA0A0A0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Countdown
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_secondsRemaining",
                   style: TextStyle(
                       fontSize: MediaQuery.of(context).size.width * 0.3,
                       fontWeight: FontWeight.w800
                   ),
                  ),
                  Text(
                     "seconds",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Ride Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailRow(Icons.calendar_today, "Date/Time: ", ''),
                  const SizedBox(height: 10),
                  detailRow(Icons.location_on, "Pickup:  ","" ),
                  const SizedBox(height: 8),

                  // ✅ VIA LOCATIONS IF AVAILABLE
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: widget.viaLocation.map((via) {
                  //     return
                  //       Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 2.0),
                  //       child: detailRow(Icons.route, "Via:  ", via),
                  //     );
                  //   }).toList(),
                  // )
                  //     : const SizedBox.shrink(),

                  const SizedBox(height: 8),
                  detailRow(Icons.location_on_outlined, "Dropoff:  ","" ),
                ],
              ),
            ),

            // Accept / Reject Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.driverDashboard);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff568805),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                      ),
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: const Text("Accept", style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed:
                      (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff880606),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 6,
                      ),
                      icon: const Icon(Icons.cancel_outlined, color: Colors.white),
                      label: const Text("Reject", style: TextStyle(fontSize: 20,color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$label ',
                  style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 22),
                ),
                TextSpan(text: value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
