// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:async';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BreakScreen extends StatefulWidget {
  const BreakScreen({super.key});

  @override
  State<BreakScreen> createState() => _BreakScreenState();
}

class _BreakScreenState extends State<BreakScreen> {
  bool _isCountdownRunning = true;
  Timer? countdownTimer;
  int breaktimeRemaining = 300; // 👈 example 5 minutes (300 seconds)
  int initialBreakTime = 300;

  @override
  void initState() {
    super.initState();
    startBreakTime(); // 👈 screen khulte hi timer start ho jayega
  }

  void startBreakTime() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (breaktimeRemaining > 0 && _isCountdownRunning) {
        setState(() {
          breaktimeRemaining -= 1;
        });
      } else {
        countdownTimer?.cancel();
        setState(() {
          _isCountdownRunning = false;
        });

        // Break khatam hone par Dashboard pe bhej do
        Get.offAllNamed(Routes.driverDashboard);
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double progress = initialBreakTime > 0
        ? breaktimeRemaining / initialBreakTime
        : 0;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Break Time Remaining',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: _isCountdownRunning ? progress : 0,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                Text(
                  formatTime(breaktimeRemaining),
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                countdownTimer?.cancel(); // 👈 button dabate hi timer stop
                Get.offAllNamed(Routes.driverDashboard);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 91, 19, 128),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: Text(
                'End Break',
                style: gilroyMedium(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
