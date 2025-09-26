import 'package:driver_app_alpha/Component/brightness.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Controller/navigationController.dart';
import 'package:driver_app_alpha/View/home/Setting/message.dart';
import 'package:driver_app_alpha/View/home/Setting/navigation_type.dart';
import 'package:driver_app_alpha/View/home/Setting/privacyPolicy.dart';
import 'package:driver_app_alpha/View/home/Setting/syncWidget.dart';
import 'package:driver_app_alpha/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  double get _sliderVal => 0.5;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    final AmountController amountController = Get.find();
    final theme = Theme.of(context);
    return Scaffold(
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
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("v 103.14", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, top: 20.0, right: 2.0),
          child: Column(
            children: [
              // ----------------- Night Mood -------------------------------
              Container(
                height: 60,
                color: theme.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.dark_mode_outlined, size: 30),
                      const SizedBox(width: 10),
                      Text(
                        "Night Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => Switch(
                          value: controller.isDark.value,
                          onChanged: (value) {
                            controller.toggleTheme();
                            print("Switch clicked: ${controller.isDark.value}");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 2),

              // ----------------- Brightness Slider -------------------------------
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BrightnessWidget();
                    },
                  );
                },
                child: Container(
                  height: 60,
                  color: theme.cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.brightness_4_outlined, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Change Brightness",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),

              // ----------------- Add Message  -------------------------------
              GestureDetector(
                onTap: () {
                  Get.to(const MessageScreen());
                },
                child: Container(
                  height: 60,
                  color: theme.cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.post_add_outlined, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Add Message Template",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),

              // ----------------- Sync Settings -------------------------------
              GestureDetector(
                // onTap: () => Sync_Widget(),
                child: Container(
                  height: 60,
                  color: theme.cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings_suggest_rounded, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Sync Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),

              // ----------------- Navigation Type -------------------------------
              GestureDetector(
                onTap: () => Get.bottomSheet(NavigationType()),
                child: Container(
                  height: 60,
                  color: theme.cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.navigation, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Navigation Type",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),

              // ----------------- Privacy Policy -------------------------------
              GestureDetector(
                onTap: () {
                  Get.to(const PrivacyPolicy());
                },
                child: Container(
                  height: 60,
                  color: theme.cardColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(height: 2),

              const SizedBox(height: 10.0),

              // ----------------- Hide Earning -------------------------------
              Container(
                height: 60,
                color: theme.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.bar_chart_rounded, size: 30),
                      SizedBox(width: 10),
                      Text(
                        "Hide Earning",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                      const Spacer(),
                       Obx(() => Switch(
                  value: amountController.hideAmount.value,
                  onChanged: (value) {
                    amountController.hideAmount.value = value;
                  },
                )),
                    ],
                  ),
                ),
              ),
              const Divider(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
