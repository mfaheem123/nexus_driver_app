import 'package:driver_app_alpha/Component/booking_card.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclinedScreen extends StatelessWidget {
  const DeclinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Declined Booking',
          style: gilroySemiBold(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsetsGeometry.all(10.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 25,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBookingCard(
                      PicUp_Location: "Pick Up Location",
                      Via_1_Location: "Via 1",
                      Via_2_Location: "Via 2",
                      Drop_of_Location: "Drop Of Location",
                      bookingDate: "18-09-2025",
                      fare: "Fare : 29€",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
