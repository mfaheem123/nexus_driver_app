import 'package:driver_app/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:driver_app/Routes/app_pages.dart';


class JobInvitationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 91, 19, 128),
                padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Job Invitation',
                      style: gilroySemiBold(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                          Icons.power_settings_new,
                          size: 25, color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: heights/4,
                width: widths,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  color: Colors.grey.withOpacity(0.3)
                ),
                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.green, // Green background for the icon
                                child: Icon(Icons.notifications_none, size:25, color: Colors.white),
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heights/20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hello john,",
                        style: gilroyBold(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("You have a ride",
                        style: gilroySemiBold(
                          color: Colors.lightBlue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoSection(title: "Pick up location", icon: Icons.location_on, text: "123 Anywhere Street, Any Other test city"),
                    SizedBox(height: heights/35,),

                    buildInfoSection(title: "Drop Off location", icon: Icons.location_on, text: "123 Anywhere Street, Any Other test city"),
                    SizedBox(height: heights/35,),

                    Text(
                      "Your distance from pick up",
                      style: gilroySemiBold(
                          fontSize: 25,
                          color: Colors.blue[900], fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("2 km",
                          style: gilroySemiBold(
                              fontSize: 15,
      
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: widths/45,),
                        Container(
                          height: heights/45,
                          width: 2,
                          color: Colors.black,
                        ),
                        SizedBox(width: widths/45,),
                        Text("Approx 5-7 mins",
                          style: gilroySemiBold(
                              fontSize: 15,
      
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: heights/35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      CircleAvatar(
                        radius:20,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.share_arrival_time_outlined,
                          color: Colors.white,
                            size: 30,
                          )),
                        SizedBox(width: widths/45,),
                        Text(
                          "Respond In :",
                          style: gilroySemiBold(
                              fontSize: 25,
                              color: Colors.blue[900], fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "58 Sec",
                          style: gilroySemiBold(
                              fontSize: 25,
                              color: Colors.blue[900], fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: heights/15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
      Get.toNamed(Routes.rideInfoScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 63, 172, 67),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                          ),
                          child: Text(
                            'Accept',
                            style: gilroyMedium(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String selectedReason = '';
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      titlePadding: EdgeInsets.only(top: 10, left: 20, right: 10),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Reject Reasons',
                                            style: gilroySemiBold(
                                                fontSize: 20,
                                                color: Colors.blue, fontWeight: FontWeight.bold),
                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.of(context).pop(),
                                            child: Icon(Icons.close, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RadioListTile<String>(
                                            title: Text("I have an issue in my car"),
                                            value: "car_issue",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(() => selectedReason = value!);
                                            },
                                          ),
                                          RadioListTile<String>(
                                            title: Text("I can't entertain more rides today",),
                                            value: "no_more_rides",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(() => selectedReason = value!);
                                            },
                                          ),
                                          RadioListTile<String>(
                                            title: Text("Not feeling well, can't drive"),
                                            value: "not_well",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(() => selectedReason = value!);
                                            },
                                          ),
                                          SizedBox(height: 10),
                                          Container(

                                            decoration: BoxDecoration(
                                              color:Colors.blue,
                                              border: Border(
                                                left: BorderSide(color: Colors.black, width: 2),
                                                right: BorderSide(color: Colors.black, width: 2),
                                                bottom: BorderSide(color: Colors.black, width: 2),
                                              ),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                                                elevation: 0, // Avoid shadow
                                              ),
                                              onPressed: () {
                                                // handle submission
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'SUBMIT',
                                                style: gilroyMedium(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                          ),
                          child: Text(
                            'Reject',
                            style: gilroyMedium(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection({required String title, required IconData icon, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: gilroySemiBold(
              fontSize: 25,

              color: Colors.blue[900], fontWeight: FontWeight.bold),


        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Icon(icon, size: 22, color: Colors.green),
            SizedBox(width: 5),
            Expanded(child:
            Text(text,
              style: gilroySemiBold(
                  fontSize: 15,

                  color: Colors.black, fontWeight: FontWeight.bold),
            )
            ),
          ],
        ),
      ],
    );
  }
}


