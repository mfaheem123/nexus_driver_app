import 'package:driver_app_alpha/Component/booking_card.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// class JobDetailsScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Column(
//         children: [
//           // Header Section
//           Container(
//             color: Colors.deepPurple,
//             padding: const EdgeInsets.only(top: 40, bottom: 20),
//             child: const Center(
//               child: Text(
//                 'Job Details',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),

//           // Profile Card
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.all(12),
//             child: const Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundImage: AssetImage(
//                     'assets/profile.jpg',
//                   ), // Use appropriate image
//                 ),

//                 SizedBox(width: 10),

//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Hi, John",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text("Congratulation, You have done your job."),
//                       Text("Here you have your job details"),
//                     ],
//                   ),
//                 ),
//                 Icon(Icons.notifications, color: Colors.green),
//               ],
//             ),
//           ),

//           // Filter Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: DropdownButtonFormField(
//                     items: [],
//                     onChanged: (_) {},
//                     hint: const Text('Date'),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Expanded(
//                   child: DropdownButtonFormField(
//                     items: [],
//                     onChanged: (_) {},
//                     hint: const Text('Drop off'),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Expanded(
//                   child: DropdownButtonFormField(
//                     items: [],
//                     onChanged: (_) {},
//                     hint: const Text('Pick up'),
//                   ),
//                 ),
//                 const Icon(Icons.search),
//               ],
//             ),
//           ),

//           // Job List
//           Expanded(
//             child: ListView.builder(
//               itemCount: 5,
//               itemBuilder: (_, index) => const Card(
//                 margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 child: Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, color: Colors.green),
//                           SizedBox(width: 5),
//                           Text('123 Anywhere Street, Any City'),
//                         ],
//                       ),
//                       SizedBox(height: 4),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, color: Colors.red),
//                           SizedBox(width: 5),
//                           Text('123 Anywhere Street, Any City'),
//                         ],
//                       ),
//                       SizedBox(height: 6),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('2-3 2025'),
//                           Row(
//                             children: [
//                               Text(
//                                 'Completed',
//                                 style: TextStyle(
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Fare : 29€',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        centerTitle: true,
        title: Text(
          'JOB DETAILS',
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
          // Header Section
          // Container(
          //   color: Colors.deepPurple,
          //   padding: const EdgeInsets.only(top: 40, bottom: 20),
          //   child: const Center(
          //     child: Text(
          //       'Job Details',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 22,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),

          // Profile Card
          Container(
            // height: MediaQuery.of(context).size.height ,
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/profile.jpg',
                  ), // Use appropriate image
                ),

                SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, John",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Congratulation, You have done your job."),
                    Text("Here you have your job details"),
                  ],
                ),
                Icon(Icons.notifications, color: Colors.green),
              ],
            ),
          ),

          // Filter Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: DropdownButtonFormField(
                      items: [],
                      onChanged: (_) {},
                      hint: const Text('Date', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    child: DropdownButtonFormField(
                      items: [],
                      onChanged: (_) {},
                      hint: const Text(
                        'Drop off',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    child: DropdownButtonFormField(
                      items: [],
                      onChanged: (_) {},
                      hint: const Text(
                        'Pick up',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),

          //  List of job-------------------------------------------------------------------
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
                      PicUp_Location: "Pic Up Location",
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
