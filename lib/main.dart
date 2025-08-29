import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Component/API.dart';
import 'package:get/get.dart';
import 'Routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        // stream: checkStream.stream,
        builder: (context, snapshot) {
          return GetMaterialApp(
            title: 'Driver App',
            themeMode: API().sp.read('themeMode') == null || API().sp.read('themeMode') == "dark"
                ? ThemeMode.dark
                : ThemeMode.light,
            navigatorObservers: [BotToastNavigatorObserver()],
            builder: (context, child) {
              child = BotToastInit()(context, child);
              child = EasyLoading.init()(context, child);
              child = ScrollConfiguration(
                behavior: MyBehavior(),
                child: child,
              );
              return child;
            },
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          );

        }, stream: null,);
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
