import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverPaymentScreen extends StatefulWidget {
  const DriverPaymentScreen({super.key});

  @override
  State<DriverPaymentScreen> createState() => _DriverPaymentScreenState();
}

class _DriverPaymentScreenState extends State<DriverPaymentScreen> {
  String? selectedOption = "balance";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ----------- AppBar -------------
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xFF5B1380),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/SettingsScreen');
          },
          icon: const Icon(Icons.settings, color: Colors.white),
        ),
        title: const Text(
          "Driver Payment",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.power_settings_new,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Mohammad Faheem",
                style: TextStyle(
                  fontSize: 16,
                  color: theme.textTheme.bodyMedium!.color,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 182, 182, 182),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "**** **** **** 7654",
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium!.color,

                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Current Balance Option
            Row(
              children: [
                Radio<String>(
                  value: "balance",
                  groupValue: selectedOption,
                  onChanged: (val) {
                    setState(() {
                      selectedOption = val;
                    });
                  },
                ),
                const Text(
                  "Current balance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Text(
                    "456 £",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("(Excluded fees)", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Others Option
            Row(
              children: [
                Radio<String>(
                  value: "others",
                  groupValue: selectedOption,
                  onChanged: (val) {
                    setState(() {
                      selectedOption = val;
                    });
                  },
                ),
                Text(
                  "Others",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyMedium!.color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 182, 182, 182),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pay Now Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Payment Activity
            const Text(
              "Payment Activity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Statement , Recent and pending charges",
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Back Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(100, 40),
                ),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
