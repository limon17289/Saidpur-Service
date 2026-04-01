import 'package:get/get.dart';
import 'package:saidpure_service/SignupScreen/signup_screen_controller.dart';


class SingupScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignupScreenController());
  }
}
