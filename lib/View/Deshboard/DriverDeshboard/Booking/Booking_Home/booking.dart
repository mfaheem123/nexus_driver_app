import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/declined.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/fob.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/future.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/missed.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/past.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/Booking_Widget/present.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Booking_Screen extends StatelessWidget {
  const Booking_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: DynamicColors.whiteColor,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        title: Text(
          'Bookings',
          style: gilroySemiBold(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: theme.cardColor,
              ),
              // alignment: Alignment.center,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  final tappedText = CardText.allText[index];
                  if (tappedText == "Present") {
                    Get.to(() => const PresentScreen());
                  } else if (tappedText == "Past") {
                    Get.to(() => PastScreen());
                  } else if (tappedText == "Future") {
                    Get.to(() => const FutureScreen());
                  } else if (tappedText == "FOB") {
                    Get.to(() => const FobSreen());
                  } else if (tappedText == "Missed") {
                    Get.to(() => const MissedScreen());
                  } else if (tappedText == "Declined") {
                    Get.to(() => const DeclinedScreen());
                  }
                },
                child: CardButton(
                  CardText.allText[index],
                  CardIcons.allIcons[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget CardButton(String titile, IconData Cicon) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            titile,
            style: gilroySemiBold(
              color: const Color.fromARGB(204, 131, 25, 184),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(thickness: 3, endIndent: 120, indent: 4.5),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.fromLTRB(
                    left: const BorderSide(
                      color: Color.fromARGB(255, 91, 19, 128),
                      width: 1.0,
                    ),
                    bottom: const BorderSide(
                      color: Color.fromARGB(255, 91, 19, 128),
                      width: 1.0,
                    ),
                  ),
                  //  BoxBorder.fromBorderSide(BorderSide(color: Colors.black))
                ),
                child: Icon(Cicon, size: 35, color: DynamicColors.greenColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//   Card k under jo text or icon arha hai wo hai ye

class CardIcons {
  static const IconData present = Icons.calendar_month;
  static const IconData past = Icons.calendar_month;
  static const IconData futureIcon = Icons.calendar_month;
  static const IconData fOB = Icons.calendar_month;
  static const IconData missed = Icons.calendar_month;
  static const IconData declined = Icons.calendar_month;

  static const List<IconData> allIcons = [
    present,
    past,
    futureIcon,
    fOB,
    missed,
    declined,
  ];
}

class CardText {
  static const String present = "Present";
  static const String past = "Past";
  static const String futurE = "Future";
  static const String fOB = "FOB";
  static const String missed = "Missed";
  static const String declined = "Declined";

  static const List<String> allText = [
    present,
    past,
    futurE,
    fOB,
    missed,
    declined,
  ];
}
