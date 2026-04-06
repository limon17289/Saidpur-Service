import 'package:get/get.dart';
import 'package:saidpure_service/OtpScreen/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>OtpScreenController());
  }
}