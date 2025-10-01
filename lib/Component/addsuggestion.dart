import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddsuggestionWidget extends StatelessWidget {
  final onSelect;

  AddsuggestionWidget({super.key, this.onSelect});

  List suggestion = [
    "1. Passenger on Board",
    "2. Book me on",
    "3. I am going on Break",
    "4. I am finishing for the day",
    "5. I am base",
    "6. I am clear",
    "7. Passenger taking multiple stops",
    "8. I am going on break after this job",
    "9. Is there any Meet and Greet changes for this job",
    "10. Stuck in Traffic",
    "11. Call me",
    "12. I am going home",
    "13. I am finishing for the day",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, right: 15, left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),

        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 91, 19, 128),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 30,

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Suggestions",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: suggestion.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suggestion[index]),
                    onTap: () {
                      onSelect(suggestion[index]);
                      Get.back();
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 1,
                    child: Divider(color: Colors.grey),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
