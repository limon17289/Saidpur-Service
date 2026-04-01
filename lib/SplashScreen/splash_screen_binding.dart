import 'package:get/get.dart';
import 'package:saidpure_service/SplashScreen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
  }
}
