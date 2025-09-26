import 'package:bot_toast/bot_toast.dart';
import 'package:driver_app_alpha/Controller/navigationController.dart';
import 'package:driver_app_alpha/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AmountController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return StreamBuilder<bool>(
      // stream: checkStream.stream,
      builder: (context, snapshot) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Driver App',

            //  system ke hisaab se auto switch hoge theme
            // themeMode: ThemeMode.system,
            theme: controller.theme,

            navigatorObservers: [BotToastNavigatorObserver()],
            builder: (context, child) {
              child = BotToastInit()(context, child);
              child = EasyLoading.init()(context, child);
              child = ScrollConfiguration(behavior: MyBehavior(), child: child);
              return child;
            },
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          ),
        );
      },
      stream: null,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
