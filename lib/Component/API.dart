import 'dart:async';
import 'dart:core';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import '../Network/ErrorMethod.dart';
import '../Network/Url.dart';
import 'color.dart';

class API {
  String dummyProfile = "https://www.itdp.org/wp-content/uploads/2021/06/avatar-man-icon-profile-placeholder-260nw-1229859850-e1623694994111.jpg";

  ///SingleTon
  static final API _singleton = API._internal();
  var sp = GetStorage();
  factory API() {
    return _singleton;
  }

  Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 10), receiveTimeout: Duration(seconds: 10),));

  API._internal();
  Dio addInterceptors() {
    return dio
      ..interceptors.add(InterceptorsWrapper(
          onError: (dioError, interceptorErrorCallback) async {
        returnResponse(dioError.response!);
      }));
  }

  ///Get
  Future<dynamic> getApi(
      {url, fullUrl, Map<String, dynamic>? queryParameters}) async {
    dio.options.headers['Authorization'] = "Bearer ${sp.read('token')}";
    dio.options.headers['Accept'] = "application/json";

    if (url != "") {
      try {
        // showLoading();
        final response = await dio.get(fullUrl ?? Url().baseUrl + url,
            queryParameters: queryParameters);
        return response;
      } on DioException catch (e) {
        // BotToast.closeAllLoading();
        return returnResponse(e.response!);
      }
    }
  }

  ///Post
  Future<dynamic> postApi(
    formData,
    url, {
    fullUrl,token,
    auth = true,
    multiPart = false,
    showProgress = false,
    context,

    /*required RoundedLoadingButtonController postButton*/
  }) async {

    print(Url().baseUrl + url);

    try {
      if (auth == true) {
        dio.options.headers['Authorization'] = "Bearer ${token??sp.read('token')}";
        dio.options.headers['Accept'] = "application/json";
      }

      if (showProgress == true) {

        showLoading();
      }
      dynamic response = await dio.post(fullUrl ?? Url().baseUrl + url,
          data: formData,
          options: multiPart == true
              ? Options(
                  headers: {
                    Headers.acceptHeader: "application/json",
                  },
                  contentType: 'multipart/form-data',
                )
              : Options(
                  headers: {
                    Headers.acceptHeader: "application/json",
                  },
                ), onSendProgress: (int progress, int total) {
        //print(progress);
        //print(total);
      });

      BotToast.closeAllLoading();
      return response;
    } on DioException catch (e) {
      BotToast.closeAllLoading();
      return returnResponse(e.response);
    }
  }

  Future<void> deleteAllKeysExceptOne(
      String keyToKeep, String themeMode) async {
    GetStorage storage = GetStorage();
    List<String> allKeys = storage.getKeys().toList();

    for (String key in allKeys) {
      if (key != keyToKeep && key != themeMode) {
        await storage.remove(key);
      }
    }
  }
}

errorIcon(postButton) async {
  postButton.error();
  Timer(Duration(seconds: 3), () {
    postButton.reset();
  });
}
//

class LoaderClass extends StatelessWidget {
  LoaderClass({this.colorOne, this.colorTwo});

  final Color? colorOne;
  final Color? colorTwo;

  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? colorOne?? ( API().sp.read('themeMode') == null || API().sp.read('themeMode') == "dark"?
            DynamicColors.whiteColor
                :DynamicColors.primaryColor)
                : colorTwo ?? DynamicColors.secondaryColor,
          ),
        );
      },
    );
  }
}

showLoading() {
  return BotToast.showCustomLoading(
      toastBuilder: (_) => Center(
              child: LoaderClass(
            colorOne:API().sp.read('themeMode') == null || API().sp.read('themeMode') == "dark"?
                DynamicColors.whiteColor
                : DynamicColors.primaryColor,
            colorTwo: DynamicColors.secondaryColor.withOpacity(0.5),
          )),
      animationDuration: Duration(milliseconds: 300));
}
