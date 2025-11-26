// import 'package:driver_app/Component/textStyle.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:driver_app/Routes/app_pages.dart';
// class RideInfoScreen extends StatelessWidget {
//   const RideInfoScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double heights = MediaQuery.of(context).size.height;
//     double widths = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:Color(0xff2A1655),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 color: Color(0xff2A1655),
//                 // const Color.fromARGB(255, 91, 19, 128),
//                 padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // const Icon(Icons.settings, color: Colors.white, size: 30),
//                     Text(
//                       'Job Invitation',
//                       style: gilroySemiBold(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // Container(
//                     //   decoration: const BoxDecoration(
//                     //     shape: BoxShape.circle,
//                     //     color: Colors.green,
//                     //   ),
//                     //   padding: const EdgeInsets.all(6),
//                     //   child: const Icon(Icons.power_settings_new, size: 25, color: Colors.white),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: heights / 4.5,
//                 width: widths,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   color: Color(0xff7855CB
//                   )
//                 ),
//                 child: Column(
//                   children: [
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 24.0, ),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.end,
//                     //     children: [
//                     //       Stack(
//                     //         children: [
//                     //           const CircleAvatar(
//                     //             radius: 18,
//                     //             backgroundColor: Colors.green,
//                     //             child: Icon(Icons.notifications_none, size: 25, color: Colors.white),
//                     //           ),
//                     //           Positioned(
//                     //             right: 0,
//                     //             child: CircleAvatar(
//                     //               radius: 7,
//                     //               backgroundColor: Colors.red,
//                     //               child: const Text(
//                     //                 '1',
//                     //                 style: TextStyle(fontSize: 10, color: Colors.white),
//                     //               ),
//                     //             ),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                     SizedBox(height: heights / 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Thanks john,",
//                           style: gilroyBold(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Now your passenger is waiting",
//                           style: gilroySemiBold(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         "Ride Info",
//                         style: gilroyBold(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: heights / 45),
//                     buildInfoSection(title: "Name", icon: Icons.person, text: "Muhammad Faheem"),
//                     SizedBox(height: heights / 65),
//                     buildInfoSection(title: "Pick up location", icon: Icons.location_on, text: "123 Anywhere Street, Any Other test city"),
//                     SizedBox(height: heights / 65),
//                     buildInfoSection(title: "Drop Off location", icon: Icons.location_on, text: "123 Anywhere Street, Any Other test city"),
//                     SizedBox(height: heights / 65),
//                     Row(
//                       children: [
//                         Text(
//                           "Fare :",
//                           style: gilroySemiBold(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           " 29€",
//                           style: gilroySemiBold(fontSize: 40, color:Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: heights / 25),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.green,
//                           child: Icon(Icons.share_arrival_time_outlined, color: Colors.white, size: 30),
//                         ),
//                         SizedBox(width: widths / 45),
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: Color(0xff7855CB
//                             ),
//                             borderRadius: const BorderRadius.all(Radius.circular(20)),
//                           ),
//                           child: Text(
//                             "I am on the Way",
//                             style: gilroySemiBold(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 60),
//                     const SwipeToArriveCard(), // updated swipe widget
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildInfoSection({required String title, required IconData icon, required String text}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: gilroySemiBold(
//               fontSize: 22,
//               color: Colors.white,
//               fontWeight: FontWeight.bold
//           ),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             Icon(icon, size: 22, color:Color(0xffD1F080
//             ),
//             ),
//             const SizedBox(width: 5),
//             Expanded(
//               child: Text(
//                 text,
//                 style:gilroyMedium(fontSize: 15,
//                     color:Color(0xffD1F080),
//                     // fontWeight: FontWeight.
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class SwipeToArriveCard extends StatefulWidget {
//   const SwipeToArriveCard({super.key});
//
//   @override
//   State<SwipeToArriveCard> createState() => _SwipeToArriveCardState();
// }
//
// class _SwipeToArriveCardState extends State<SwipeToArriveCard> {
//   double _position = 0.0;
//   double maxSwipeDistance = 250;
//
//   bool _isArrived = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Color(0xff6B46BA),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Stack(
//         children: [
//           Center(
//             child: Text(
//               _isArrived ? "ARRIVED!" : "      Swipe to ARRIVED",
//               style: const TextStyle(color:Colors.white , fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//           ),
//           Positioned(
//             left: _isArrived ? maxSwipeDistance : _position,
//             child: GestureDetector(
//               onHorizontalDragUpdate: (details) {
//                 setState(() {
//                   _position += details.delta.dx;
//                   if (_position < 0) _position = 0;
//                   if (_position > maxSwipeDistance) _position = maxSwipeDistance;
//                 });
//               },
//               onHorizontalDragEnd: (details) {
//                 if (_position >= maxSwipeDistance) {
//                   setState(() => _isArrived = true);
//
//                   /// ✅ Navigate after swipe
//                   Future.delayed(const Duration(milliseconds: 400), () {
//                    Get.toNamed(Routes.fareMeterScreen);
//                   });
//                 } else {
//                   setState(() => _position = 0); // reset if not full swipe
//                 }
//               },
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle),
//                 child: Icon(Icons.double_arrow_rounded,size: 30,
//                 color: Color(0xff2A1655),
//                 )
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//

import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideInfoScreen extends StatelessWidget {
  const RideInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.bannerTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                   
              SizedBox(height:  10),
              Text(
                "Job Invitation",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:  10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: heights / 1.2,
                  width: widths,
                  decoration: BoxDecoration(
                      color: theme.canvasColor, 
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Thanks John,",
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium!.color,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Now your passenger is waiting.",
                            style: TextStyle(
                              color: theme
                                  .textTheme
                                  .bodyMedium!
                                  .color, // yha pr color hai ---------------
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: heights / 15),
                        Text(
                          "Ride Info",
                          style: TextStyle(
                            color: theme
                                .textTheme
                                .bodyMedium!
                                .color, // yha pr color hai --------------------
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: heights / 45),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Color(0xff2D1264),
                            ), // yha pr color hai ------------------
                            SizedBox(width: widths / 45),
                            Text(
                              "Muhammad Faheem ",
                              style: TextStyle(
                                color: theme
                                    .textTheme
                                    .bodyMedium!
                                    .color, // yha pr color hai -------------------------
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heights / 45),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Color(0xff2D1264),
                            ),
                            SizedBox(width: widths / 45),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pick up location",
                                  style: TextStyle(
                                    color: theme
                                        .textTheme
                                        .bodyMedium!
                                        .color, // yha pr color hai -----------------------------
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "123 AnyWhere Street....",
                                  style: TextStyle(
                                    color: theme
                                        .textTheme
                                        .bodyMedium!
                                        .color, // yha pr color hai -------------------
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: heights / 45),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Color(0xff2D1264),
                            ), // yha pr color hai ---------------
                            SizedBox(width: widths / 45),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Drop of Location",
                                  style: TextStyle(
                                    color: theme
                                        .textTheme
                                        .bodyMedium!
                                        .color, // yha pr color hai ----------------------
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "123 AnyWhere Street....",
                                  style: TextStyle(
                                    color: theme
                                        .textTheme
                                        .bodyMedium!
                                        .color, // yha pr color hai ------------------------
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: heights / 45),
                        Text(
                          "Fare:£29",
                          style: TextStyle(
                            color: theme
                                .textTheme
                                .bodyMedium!
                                .color, // yha pr color hai -----------------------------
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: heights / 25),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xff42A451,
                                ), // yha pr color hai ---------------------
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 90,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'I am on the Way',
                                style: gilroyMedium(
                                  color: Colors
                                      .white, // yha pr color hai ----------------------
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: heights / 45),
                        const SwipeToArriveCard(),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Get.toNamed(Routes.fareMeterScreen);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color(0xff40158B),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //     padding: EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                        //   ),
                        //   child: Text(
                        //     'ARRIVED!',
                        //     style: gilroyMedium(color: Colors.white, fontSize: 18),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: heights / 15),
            ],
          ),
        ),
      ),
    );
  }
}

class SwipeToArriveCard extends StatefulWidget {
  const SwipeToArriveCard({super.key});

  @override
  State<SwipeToArriveCard> createState() => _SwipeToArriveCardState();
}

class _SwipeToArriveCardState extends State<SwipeToArriveCard> {
  double _position = 0.0;
  double maxSwipeDistance = 250;

  bool _isArrived = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder(
      builder: (context) {
        return Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color:   theme.focusColor, // yha pr color hai ------------------------
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  _isArrived ? "ARRIVED!" : "      Swipe to ARRIVED",
                  style:  TextStyle(
                    color: Colors.white, // yha pr color hai ------------------------
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Positioned(
                left: _isArrived ? maxSwipeDistance : _position,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _position += details.delta.dx;
                      if (_position < 0) _position = 0;
                      if (_position > maxSwipeDistance)
                        _position = maxSwipeDistance;
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_position >= maxSwipeDistance) {
                      setState(() => _isArrived = true);
                      Future.delayed(const Duration(milliseconds: 400), () async {
                      await  Get.toNamed(Routes.fareMeterScreen);

                      });
                    } else {
                      setState(() => _position = 0);
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xffE9FF6C),

                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.double_arrow_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
