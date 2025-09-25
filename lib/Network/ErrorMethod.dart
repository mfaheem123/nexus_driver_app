import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'API.dart';

dynamic returnResponse(Response? responseData) {
  if (responseData   == null) {
    BotToast.closeAllLoading();
    BotToast.showText(text: 'Internet Error');

  } else {
    BotToast.closeAllLoading();
    switch (responseData.statusCode) {
      case 200:
        var responseJson = json.decode(responseData.data.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        BotToast.showText(text:responseData.data["message"] is String?
        responseData.data["message"]
            : responseData.data["message"][0].toString());
        break;
      case 401:
        if (responseData.data["message"] == "Unauthenticated.") {
          BotToast.showText(
              text: "Session has been expired!! Please Sign in again"
                  "",
              duration: Duration(seconds: 2));
          final theme = API().sp.read("themeMode");
          API().sp.erase();
          API().sp.write("themeMode", theme);
          // getx.Get.offAllNamed(Routes.signUpScreen);
        } else {
          BotToast.showText(text:responseData.data["message"] is String?
          responseData.data["message"] : responseData.data["message"][0].toString());
        }
        break;
      case 404:
        BotToast.showText(text:responseData.data["message"] is String?
        responseData.data["message"]
        : responseData.data["message"][0].toString());
        break;
      case 410:
        BotToast.showText(text:responseData.data["message"] is String?
        responseData.data["message"]
            : responseData.data["message"][0].toString());
        getx.Get.back();
        break;
      case 406:
        BotToast.showText(text: "This user is deleted");
        // if(responseData.data["error"] == "this account is not available"){
        //   final theme = API().sp.read("themeMode");
        //   API().sp.erase();
        //   API().sp.write("themeMode", theme);
        //   getx.Get.offAllNamed(Routes.logInScreen);
        // }
        break;
      case 403:
        BotToast.showText(text:responseData.data["message"] is String?
        responseData.data["message"]
            : responseData.data["message"][0].toString());
        break;
      case 422:
        if (responseData.data["data"] == null) {
          return null;
        }

        else {
          BotToast.showText(text:responseData.data["message"] is String?
          responseData.data["message"]
              : responseData.data["message"][0].toString());
        }

        break;
      case 500:
      default:
        throw BotToast.showText(
            text:
                ('Error occurred while Communication with Server with StatusCode : ${responseData.statusCode}'));
    }
  }
}
