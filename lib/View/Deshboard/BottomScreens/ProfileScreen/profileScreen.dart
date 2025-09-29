import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme
          .scaffoldBackgroundColor, // yha pr color hai -------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Profile Picture with Camera Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors
                      .green, // yha pr color hai -------------------------
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    backgroundColor: theme
                        .scaffoldBackgroundColor, // yha pr color hai -----------------------------
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors
                        .white, // yha pr color hai -----------------------------
                    child: Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Colors.black,
                    ), // yha pr color hai --------------
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Marceline Anderson",
              style: TextStyle(
                color: theme
                    .textTheme
                    .bodyMedium!
                    .color, // yha pr color hai ---------------------------
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.greenAccent,
                ), // yha pr color hai --------------------------
                SizedBox(width: 5),
                Text(
                  "Central London",
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium!.color,
                  ), // yha pr color hai ------------------------------------
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Profile Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 133, 132, 132).withOpacity(
                  0.1,
                ), // yha pr color hai --------------------------
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileInfoItem(
                    title: "Full Name",
                    value: "Marceline Anderson",
                  ),
                  _ProfileInfoItem(
                    title: "Email",
                    value: "MarcelineAnderson123@gmail.com",
                  ),
                  _ProfileInfoItem(
                    title: "Address",
                    value: "Street 123 , Central London , UK",
                  ),
                  _ProfileInfoItem(
                    title: "Phone Number",
                    value: "+44 123456876",
                    flagEmoji: "🇬🇧",
                  ),
                  _ProfileInfoItem(
                    title: "Joining Date",
                    value: "12 / 05 / 2024",
                  ),
                  _ProfileInfoItem(
                    title: "Allotted vehicle",
                    value: "Mira , Honda BRV",
                  ),
                  _ProfileInfoItem(
                    title: "Current vehicle",
                    value: "Honda BRV",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "View Document",
                    style: TextStyle(
                      color: Colors
                          .amber, // yha pr color hai ------------------------
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Go Back Button
            SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .green, // yha pr color hai ---------------------------------
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium!.color,
                    fontSize: 16,
                  ), // yha pr color hai ------------------------------------
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final String? flagEmoji;

  _ProfileInfoItem({required this.title, required this.value, this.flagEmoji});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title\n",
              style: TextStyle(
                color: theme
                    .textTheme
                    .bodyMedium!
                    .color, // yha pr color hai -----------------------
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: flagEmoji != null ? "$flagEmoji $value" : value,
              style: TextStyle(
                color: theme
                    .textTheme
                    .bodyMedium!
                    .color, // yha pr color hai ---------------------------

                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
