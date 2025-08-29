import 'package:driver_app/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'showamount.dart';

class FareMeterScreen extends StatelessWidget {
  const FareMeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xff2A1655),
        // Color.fromARGB(255, 91, 19, 128),
        // backgroundColor: Color(0xff0F0F0F
        // ),
        body: SingleChildScrollView( // ✅ Prevent overflow
          child: Column(
            children: [
              Container(
                color: const Color(0xff2A1655),
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
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
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 30), // Empty space
                  ],
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
                      color:
                      Color(0xff2A1655),
                      // Color(0xFF2E2E2E)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '£5.50',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "2.4m",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Fare",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Distance",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
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
                                  color:Color(0xff7855CB
                                  )
                                )),
                            Container(
                                width: widths / 4.5,
                                child: const Divider(
                                  thickness: 4,
                                  color:Color(0xff7855CB)
                                  // Color(0xFF5B1380),
                                ))
                          ],
                        ),
                        SizedBox(height: heights * 0.02),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "3.00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Wait",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(width: widths / 35),
                            Container(
                              height: heights / 20,
                              width: 5,
                              decoration: const BoxDecoration(color:Color(0xff7855CB
                              )
                              // Color(0xFF5B1380)
                              ),
                            ),
                            SizedBox(width: widths / 35),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "£3.00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Charge",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
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
                          color: Color(0xff462C87
                          )
                          // const Color(0xFF5B1380).withOpacity(0.8)
                      ),
                      child: const Center(
                        child: Text(
                          "Wait",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Container(
                      height: heights / 13,
                      width: widths / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff462C87
                          )
                          // const Color(0xFF5B1380).withOpacity(0.8)
                      ),
                      child: const Center(
                        child: Text(
                          "Traffic",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: heights * 0.02),

              /// Swipe Card
              Center(child: SwipeToClearCard()),

              SizedBox(height: heights * 0.02),

              /// Passenger Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: widths,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.white
                    // Color(0xff1E1E1E).withOpacity(0.1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Passenger",
                                  style: TextStyle(
                                      color: Color(0xff21134D),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    width: widths / 4,
                                    child: const Divider(
                                      thickness: 3,
                                      color: Color(0xff7855CB
                                      )
                                      // Color(0xFF5B1380),
                                    ))
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Color(0xff4DD942),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heights * 0.015),
                        infoRow("Name  :","Ahmed Adam"),
                        infoRow("Date    :","24th March 2025"),
                        infoRow("Time   :","4pm"),
                        // SizedBox(height: heights * 0.015),
                        infoRow("Notes :","Bring Coffee"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Color(0xff21134D),
            ),
          ),
        ),

        Flexible(
          child: Text(
            "$value",
            style: const TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.bold,
              color: Color(0xff21134D),
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

  bool _isStarted = false;     // Step 1
  bool _isSoonToClear = false; // Step 2
  bool _isCleared = false;     // Step 3

  double maxSwipeDistance = 250; // max drag distance

  @override
  Widget build(BuildContext context) {
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xff6B46BA),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              displayText,
              style: const TextStyle(
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
                        MaterialPageRoute(
                          builder: (context) => ShowAmount(),
                        ),
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
                decoration: const BoxDecoration(
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

