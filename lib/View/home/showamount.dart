import 'dart:convert';
import 'package:flutter/material.dart';

import 'DriverDashboard.dart';

class ShowAmount extends StatefulWidget {




  @override
  State<ShowAmount> createState() => _ShowAmountState();
}
class _ShowAmountState extends State<ShowAmount> {
  double bookingFare = 0;
  double parkingCharges = 0;
  double waitingCharges = 0;
  double extraDropCharges = 0;

  final TextEditingController parkingController = TextEditingController();
  final TextEditingController waitingController = TextEditingController();
  final TextEditingController extraDropController = TextEditingController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    parkingController.text = "0";
    waitingController.text = "0";
    extraDropController.text = "0";
  }


  double get totalFare =>
      bookingFare + parkingCharges + waitingCharges + extraDropCharges;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Booking Fares
                  Text(
                    "Booking Fares",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff2A1655),
                      // Colors.purple.shade900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "£${bookingFare.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2A1655),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Extra Charges
                  Text(
                    "Extra Charges",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff2A1655),
                    ),
                  ),
                  const SizedBox(height: 10),

                  _buildTextField(
                    controller: parkingController,
                    label: "Parking Charges",
                    onChanged: (value) {
                      setState(() {
                        parkingCharges = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  _buildTextField(
                    controller: waitingController,
                    label: "Waiting Charges",
                    onChanged: (value) {
                      setState(() {
                        waitingCharges = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  _buildTextField(
                    controller: extraDropController,
                    label: "Extra Drop Charges",
                    onChanged: (value) {
                      setState(() {
                        extraDropCharges = double.tryParse(value) ?? 0;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  // Total Fares
                  Text(
                    "Total Fares",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2A1655),
                      // Colors.purple.shade900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "£${totalFare.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color:Color(0xff2A1655),
                    ),
                  ),

                  const SizedBox(height: 120),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff2A1655),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                 // <-- yeh method banayenge PUT request ke liye
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverDashboard(),
                          ),
                        );
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          prefixText: "£ ",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
