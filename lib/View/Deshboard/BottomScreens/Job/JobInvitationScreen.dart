import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobInvitationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "Job Invitation",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
       actions: [
       IconButton(
          onPressed: () {
            Get.toNamed('/SettingsScreen');
          },
          icon: const Icon(Icons.settings, color: Colors.white),
        ),
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
            
              Container(
                height: heights / 4,
                width: widths,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: theme.primaryColorLight,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors
                                    .green, // Green background for the icon
                                child: Icon(
                                  Icons.notifications_none,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: heights / 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello john,",
                          style: gilroyBold(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "You have a ride",
                          style: gilroySemiBold(
                            color: theme.textTheme.bodyMedium!.color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoSection(
                      title: "Pick up location",
                      icon: Icons.location_on,
                      text: "123 Anywhere Street, Any Other test city", context: context,

                    ),
                    SizedBox(height: heights / 35),

                    buildInfoSection(
                      title: "Drop Off location",
                      icon: Icons.location_on,
                      text: "123 Anywhere Street, Any Other test city", context: context,
                    ),
                    SizedBox(height: heights / 35),

                    Text(
                      "Your distance from pick up",
                      style: gilroySemiBold(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "2 km",
                          style: gilroySemiBold(
                            fontSize: 15,

                            color: theme.textTheme.bodyMedium!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: widths / 45),
                        Container(
                          height: heights / 45,
                          width: 2,
                          color: Colors.black,
                        ),
                        SizedBox(width: widths / 45),
                        Text(
                          "Approx 5-7 mins",
                          style: gilroySemiBold(
                            fontSize: 15,

                            color: theme.textTheme.bodyMedium!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heights / 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.share_arrival_time_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: widths / 45),
                        Text(
                          "Respond In :",
                          style: gilroySemiBold(
                            fontSize: 25,
                            color: theme.textTheme.bodyMedium!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "58 Sec",
                          style: gilroySemiBold(
                            fontSize: 25,
                            color: theme.textTheme.bodyMedium!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: heights / 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.rideInfoScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              63,
                              172,
                              67,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'Accept',
                            style: gilroyMedium(
                              color: theme.textTheme.bodyMedium!.color,
                              fontSize: 25,
                            ),
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
                                      titlePadding: const EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                        right: 10,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Reject Reasons',
                                            style: gilroySemiBold(
                                              fontSize: 20,
                                              color: theme.textTheme.bodyMedium!.color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RadioListTile<String>(
                                            title: const Text(
                                              "I have an issue in my car",
                                            ),
                                            value: "car_issue",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(
                                                () => selectedReason = value!,
                                              );
                                            },
                                          ),
                                          RadioListTile<String>(
                                            title: const Text(
                                              "I can't entertain more rides today",
                                            ),
                                            value: "no_more_rides",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(
                                                () => selectedReason = value!,
                                              );
                                            },
                                          ),
                                          RadioListTile<String>(
                                            title: const Text(
                                              "Not feeling well, can't drive",
                                            ),
                                            value: "not_well",
                                            groupValue: selectedReason,
                                            onChanged: (value) {
                                              setState(
                                                () => selectedReason = value!,
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: const Border(
                                                left: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromARGB(255, 91, 19, 128),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 35,
                                                  vertical: 10,
                                                ),
                                                elevation: 0, // Avoid shadow
                                              ),
                                              onPressed: () {
                                                // handle submission
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'SUBMIT',
                                                style: gilroyMedium(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'Reject',
                            style: gilroyMedium(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget buildInfoSection({
  required BuildContext context,
  required String title,
  required IconData icon,
  required String text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: gilroySemiBold(
          fontSize: 25,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: gilroySemiBold(
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

}
