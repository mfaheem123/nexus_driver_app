import 'package:driver_app_alpha/Controller/brightnessController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:screen_brightness/screen_brightness.dart';

class BrightnessWidget extends StatelessWidget {
  BrightnessWidget({super.key});
  BrightnessController _controller = Get.put(BrightnessController());

  Future<void> setApplicationBrightness(double brightness) async {
    try {
      await ScreenBrightness.instance.setApplicationScreenBrightness(
        brightness,
      );
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to set application brightness';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      content: Obx(
        () => Container(
          alignment: Alignment.center,
          height: 48,

          color: Colors.blueGrey.withOpacity(_controller.brightness.value),
          child: FutureBuilder<double>(
            future: ScreenBrightness.instance.application,
            builder: (context, snapshot) {
              double applicationBrightness = 0;
              if (snapshot.hasData) {
                applicationBrightness = snapshot.data!;
              }

              return StreamBuilder<double>(
                stream: ScreenBrightness
                    .instance
                    .onApplicationScreenBrightnessChanged,
                builder: (context, snapshot) {
                  double changedApplicationBrightness = applicationBrightness;
                  if (snapshot.hasData) {
                    changedApplicationBrightness = snapshot.data!;
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Slider.adaptive(
                   
                        value: changedApplicationBrightness,
                        onChanged: (value) {
                          setApplicationBrightness(value);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
