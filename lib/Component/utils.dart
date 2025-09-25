import 'package:bot_toast/bot_toast.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'color.dart';

class Utils {
  static height(context) {
    return MediaQuery.of(context).size.height;
  }

  static width(context) {
    return MediaQuery.of(context).size.width;
  }
}

RxDouble progress = (0.0).obs;
RxDouble chatProgress = (0.0).obs;
showCompressLoading() {
  return BotToast.showCustomLoading(
    toastBuilder: (_) => Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: DynamicColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    "${chatProgress.toInt()} %",
                    style: gilroyRegular(
                      color: DynamicColors.primaryColor,
                      fontSize: 11,
                    ),
                  );
                }),
                SizedBox(height: 5),
                Text(
                  "Compressing ..",
                  style: gilroyRegular(
                    color: DynamicColors.primaryColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}
