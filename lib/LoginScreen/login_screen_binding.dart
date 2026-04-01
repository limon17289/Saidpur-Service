import 'package:get/get.dart';
import 'package:saidpure_service/LoginScreen/login_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginScreenController());
  }
}
