import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(());
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Ashly",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),

          builder: (context, widget) {
            widget = EasyLoading.init()(context, widget);

            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              behavior: HitTestBehavior.opaque,
              child: widget,
            );
          },
          // initialRoute: Routes.splashScreen,
          getPages: [
            // GetPage(
            //   name: Routes.splashScreen,
            //   page: () => SplashScreen(),
            //   binding: splashScreenBinding(),
            // ),
          ],
        );
      },
    );
  }
}
