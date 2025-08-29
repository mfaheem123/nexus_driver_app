import 'package:driver_app/Component/textStyle.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [

    {
      "title": "Everyday English-French-Spanish: Conversation and Fun - Joel",
      "time": "9 hrs",
      "avatar": "https://via.placeholder.com/150", // Replace with real image URLs
      "unread": true,
    },

    {
      "title": "Assemblea Amici di Beppe Grillo Salerno",
      "time": "21 hours ago",
      "avatar": "https://via.placeholder.com/150",
      "unread": true,
    },

    {
      "title": "Everyday English-French-Spanish: Conversation and Fun - Joel",
      "time": "9 hrs",
      "avatar": "https://via.placeholder.com/150",
      "unread": false,
    },

    {
      "title": "Assemblea Amici di Beppe Grillo Salerno",
      "time": "21 hours ago",
      "avatar": "https://via.placeholder.com/150",
      "unread": false,
    },

    {
      "title":
      "Riunione del gruppo Casavatore in MoVimento - forum M5S",
      "time": "23 hours ago",
      "avatar": "https://via.placeholder.com/150",
      "unread": false,
    },

    {
      "title": "Napoli the Meaning of Life in Buddhism teachings Meetup",
      "time": "Yesterday",
      "avatar": "https://via.placeholder.com/150",
      "unread": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header background
            Container(
              color: Color.fromARGB(255, 91, 19, 128),
              padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                     onTap:(){
                       Get.back();
                     },
                     child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                                       ),

                   ),
                  Text(
                    'Notification',
                    style: gilroySemiBold(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 91, 19, 128),
                    ),
                    padding: const EdgeInsets.all(6),
      
                  ),
                ],
              ),
            ),


            // Back button and title
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 20),
        child: Column(
          children: [
            Container(

              padding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.grey.shade200 ,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor:Color.fromARGB(255, 91, 19, 128) ,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      radius: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Napoli the Meaning of Life in Buddhism teachings Meetup",
                          style: TextStyle(
                            fontWeight:  FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Yesterday",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),
            Container(

              padding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.grey.shade200 ,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor:Color.fromARGB(255, 91, 19, 128) ,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      radius: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Napoli the Meaning of Life in Buddhism teachings Meetup",
                          style: TextStyle(
                            fontWeight:  FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Yesterday",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
      
            // Notification List
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: ListView.builder(
            //     itemCount: notifications.length,
            //     itemBuilder: (context, index) {
            //       final item = notifications[index];
            //       return Container(
            //         color: item["unread"] ? Colors.pink[100] : Colors.transparent,
            //         padding: const EdgeInsets.symmetric(
            //             vertical: 12, horizontal: 16),
            //         child: Row(
            //           children: [
            //             CircleAvatar(
            //               backgroundImage: NetworkImage(item["avatar"]),
            //               radius: 24,
            //             ),
            //             SizedBox(width: 12),
            //             Expanded(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     item["title"],
            //                     style: TextStyle(
            //                       fontWeight: item["unread"]
            //                           ? FontWeight.bold
            //                           : FontWeight.normal,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                   SizedBox(height: 4),
            //                   Text(
            //                     item["time"],
            //                     style: TextStyle(
            //                       color: Colors.grey,
            //                       fontSize: 13,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
