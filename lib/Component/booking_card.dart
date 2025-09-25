import 'package:driver_app_alpha/Component/color.dart';
import 'package:flutter/material.dart';

class CustomBookingCard extends StatelessWidget {
  CustomBookingCard({
    super.key,
    required this.Drop_of_Location,
    required this.PicUp_Location,
    this.Via_1_Location,
    this.Via_2_Location,
    this.fare,
    this.bookingDate,
  });
  String PicUp_Location;
  String Drop_of_Location;
  String? Via_1_Location;
  String? Via_2_Location;
  String? bookingDate;
  String? fare;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----------------- Pick Up location------------------------------------
        Row(
          children: [
            const Icon(Icons.location_on, color: DynamicColors.greenColor),
            Text(PicUp_Location),
          ],
        ),
        // ------------------ Via 1 ----------------------
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 5.0, bottom: 5.0),
          child: Text(Via_1_Location!),
        ),
        // ------------------ Via 2 ----------------------
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 5.0, bottom: 5.0),
          child: Text(Via_2_Location!),
        ),
        // ------------------ Drop Off Location ----------------------
        Row(
          children: [
            const Icon(Icons.location_on, color: DynamicColors.redColor),
            Text(Drop_of_Location),
          ],
        ),
        const SizedBox(height: 5),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(bookingDate!),
            const Text(
              "Completed",
              style: TextStyle(
                color: DynamicColors.greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(fare!),
          ],
        ),
      ],
    );
  }
}
