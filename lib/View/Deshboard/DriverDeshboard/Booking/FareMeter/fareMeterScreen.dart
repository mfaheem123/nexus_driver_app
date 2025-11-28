import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/FareMeter/ShowAmount/showamount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
class FareMeterScreen extends StatefulWidget {
  const FareMeterScreen({super.key});

  @override
  State<FareMeterScreen> createState() => _FareMeterScreenState();
}

class _FareMeterScreenState extends State<FareMeterScreen> {

  @override
  void initState() {
    super.initState();
    // Screen ko sone se rokna
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    // Screen ko wapis normal karna
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
       backgroundColor: theme.bannerTheme.backgroundColor,
        body: SingleChildScrollView(
          // ✅ Prevent overflow
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  // color: Color.fromARGB(255, 91, 19, 128),
                  // padding: const EdgeInsets.only(
                  //   top: 15,
                  //   left: 20,
                  //   right: 20,
                  //   bottom: 15,
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        'FareMeter',
                        style: gilroySemiBold(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30), // Empty space
                    ],
                  ),
                ),
              ),
              SizedBox(height: heights * 0.02),

              /// Main Fare / Distance Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: widths,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.bannerTheme.backgroundColor,
                    // Color(0xFF2E2E2E)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '£5.50',
                              style: TextStyle(
                                 color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "2.4m",
                              style: TextStyle(
                               color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              "Fare",
                              style: TextStyle(
                            color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Distance",
                              style: TextStyle(
                           color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: heights * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: widths / 10,
                              child: const Divider(
                                thickness: 4,
                                color: Color(0xff7855CB),
                              ),
                            ),
                            Container(
                              width: widths / 4.5,
                              child: const Divider(
                                thickness: 4,
                                color: Color(0xff7855CB),
                                // Color(0xFF5B1380),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heights * 0.02),
                        Row(
                          children: [
                            Column(
                              children:  [
                                Text(
                                  "3.00",
                                  style: TextStyle(
                                   color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Wait",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: widths / 35),
                            Container(
                              height: heights / 20,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Color(0xff7855CB),
                                // Color(0xFF5B1380)
                              ),
                            ),
                            SizedBox(width: widths / 35),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  "£3.00",
                                  style: TextStyle(
                                   color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Charge",
                                  style: TextStyle(
                                 color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: heights * 0.02),

              /// Wait & Traffic Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: heights / 13,
                      width: widths / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: theme.focusColor,
                        // const Color(0xFF5B1380).withOpacity(0.8)
                      ),
                      child: const Center(
                        child: Text(
                          "Wait",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: heights / 13,
                      width: widths / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                    color: theme.focusColor,
                        // const Color(0xFF5B1380).withOpacity(0.8)
                      ),
                      child: const Center(
                        child: Text(
                          "Traffic",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: heights / 20),

              /// Swipe Card
              Center(child: SwipeToClearCard()),

              SizedBox(height: heights / 20),

              /// Passenger Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: widths,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.cardColor,
                    // Color(0xff1E1E1E).withOpacity(0.1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Passenger",
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium!.color,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: widths / 4,
                                  child: const Divider(
                                    thickness: 3,
                                    color: Color(0xff7855CB),
                                    // Color(0xFF5B1380),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xff4DD942),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heights * 0.015),
                        infoRow(
                          "Name  :",
                          "Ahmed Adam",
                          theme.textTheme.bodyMedium!.color,
                        ),
                        infoRow(
                          "Date    :",
                          "24th March 2025",
                          theme.textTheme.bodyMedium!.color,
                        ),
                        infoRow(
                          "Time   :",
                          "4pm",
                          theme.textTheme.bodyMedium!.color,
                        ),
                        // SizedBox(height: heights * 0.015),
                        infoRow(
                          "Notes :",
                          "Bring Coffee",
                          theme.textTheme.bodyMedium!.color,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: heights / 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: widths,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: theme.cardColor,
                    // Color(0xff1E1E1E).withOpacity(0.1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DropOff Location",
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium!.color,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: widths / 2.2,
                                  child: const Divider(
                                    thickness: 3,
                                    color: Color(0xff7855CB),
                                    // Color(0xFF5B1380),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xff4DD942),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.not_listed_location,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heights * 0.015),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Model Colony NW67BP",
                            style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyMedium!.color,
                            ),
                          ),
                        ),
                        // infoRow("Date    :","24th March 2025"),
                        // infoRow("Time   :","4pm"),
                        // // SizedBox(height: heights * 0.015),
                        // infoRow("Notes :","Bring Coffee"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: heights / 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value, color) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),

        Flexible(
          child: Text(
            "$value",
            style: TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class SwipeToClearCard extends StatefulWidget {
  @override
  _SwipeToClearCardState createState() => _SwipeToClearCardState();
}

class _SwipeToClearCardState extends State<SwipeToClearCard> {
  double _position = 0.0;
  bool _isStarted = false; // Step 1
  bool _isSoonToClear = false; // Step 2
  bool _isCleared = false; // Step 3
  double maxSwipeDistance = 310; // max drag distance

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String displayText;
    if (!_isStarted) {
      displayText = "Swipe to START";
    } else if (!_isSoonToClear) {
      displayText = "Soon to CLEAR";
    } else if (!_isCleared) {
      displayText = "Swipe to CLEAR";
    } else {
      displayText = "CLEARED!";
    }

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: theme.focusColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              displayText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          /// Swipe Ball
          Positioned(
            left: _isCleared ? maxSwipeDistance : _position,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _position += details.delta.dx;
                  if (_position < 0) _position = 0;
                  if (_position > maxSwipeDistance) {
                    _position = maxSwipeDistance;
                  }
                });
              },
              onHorizontalDragEnd: (details) {
                if (_position >= maxSwipeDistance) {
                  setState(() {
                    if (!_isStarted) {
                      // Step 1 complete
                      _isStarted = true;
                      _position = 0;
                    } else if (!_isSoonToClear) {
                      // Step 2 complete
                      _isSoonToClear = true;
                      _position = 0;
                    } else if (!_isCleared) {
                      // Step 3 complete
                      _isCleared = true;
                    }
                  });

                  // ✅ Navigate only after 3rd swipe (Cleared)
                  if (_isCleared) {
                    Future.delayed(const Duration(milliseconds: 400), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShowAmount()),
                      );
                    });
                  }
                } else {
                  setState(() {
                    _position = 0; // reset if not full swipe
                  });
                }
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // Color(0xFF5B1380),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isCleared
                      ? Icons.check
                      : _isSoonToClear
                      ? Icons.double_arrow_rounded
                      : _isStarted
                      ? Icons.double_arrow_rounded
                      // Icons.play_arrow
                      : Icons.double_arrow_rounded,
                  // Icons.play_arrow,
                  color: Color(0xff2A1655),
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// Dummy Next Screen

