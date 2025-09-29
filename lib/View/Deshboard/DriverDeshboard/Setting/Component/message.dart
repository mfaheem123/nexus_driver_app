import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMessageScreen extends StatelessWidget {
  const SettingsMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "Message",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 200,
              child: TextField(
                maxLines: 15,
                decoration: InputDecoration(
                  // label: Text("Add Templete"),
                  hintText: "Enter your message...",
                  hintStyle: TextStyle(
                    color: theme.textTheme.bodyMedium!.color,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  filled: true,
                  fillColor:    theme.inputDecorationTheme.fillColor,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 91, 19, 128),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 15,
              ),
            ),
            child: Text(
              'Add Templete',
              style: gilroyMedium(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
