import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saidpure_service/HomePage/home_page.dart';
import 'package:saidpure_service/HomePage/home_page_binding.dart';
import 'package:saidpure_service/LoginScreen/login_screen.dart';
import 'package:saidpure_service/LoginScreen/login_screen_binding.dart';
import 'package:saidpure_service/LunchScreen/lunch_screen.dart';
import 'package:saidpure_service/LunchScreen/lunch_screen_binding.dart';
import 'package:saidpure_service/SignupScreen/signup_screen.dart';
import 'package:saidpure_service/SignupScreen/signup_screen_binding.dart';
import 'package:saidpure_service/SplashScreen/splash_screen.dart';
import 'package:saidpure_service/SplashScreen/splash_screen_binding.dart';
import 'package:saidpure_service/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "saidpure service",
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

          initialRoute: Routes.homePage,

          getPages: [
            GetPage(
              name: Routes.splashScreen,
              page: () => SplashScreen(),
              binding: SplashScreenBinding(),
            ),
            GetPage(
              name: Routes.loginScreen,
              page: () => const LoginScreen(),
              binding: LoginScreenBinding(),
            ),
            GetPage(
              name: Routes.signupScreen,
              page: () => SignupScreen(),
              binding: SingupScreenBinding(),
            ),
            GetPage(
              name: Routes.lunchScreen,
              page: () => LunchScreen(),
              binding: LunchScreenBinding(),
            ),
            GetPage(
              name: Routes.homePage,
              page: () => HomePage(),
              binding: HomePageBinding(),
            ),
          ],
        );
      },
    );
  }
}
