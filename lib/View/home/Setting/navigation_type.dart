import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Controller/navigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationType extends StatelessWidget {
  NavigationType({super.key});
  NavigationController _controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    return Padding(
      padding:  EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back, size: 25),
                ),
                SizedBox(width: 60),
                Text(
                  "Select Option",
                  style: TextStyle(
                       color: theme.textTheme.bodyMedium!.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
             
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        const Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 1,

                            groupValue: _controller.groupValue.value,

                            onChanged: (value) {
                              _controller.groupValue.value = value ?? 0;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        const Text(
                          "Waze",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 2,
                            groupValue: _controller.groupValue.value,
                            onChanged: (value) {
                              _controller.groupValue.value = value ?? 0;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        const Text(
                          "Here We Go",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 3,
                            groupValue: _controller.groupValue.value,
                            onChanged: (value) {
                              _controller.groupValue.value = value ?? 0;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        const Text(
                          "All",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 4,
                            groupValue: _controller.groupValue.value,
                            onChanged: (value) {
                              _controller.groupValue.value = value ?? 0;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
