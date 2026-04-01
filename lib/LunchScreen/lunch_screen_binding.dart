import 'package:get/get.dart';
import 'package:saidpure_service/LunchScreen/lunch_screen_controller.dart';

class LunchScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LunchScreenController());
  }
}
