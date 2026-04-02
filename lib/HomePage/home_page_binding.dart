import 'package:get/get.dart';
import 'package:saidpure_service/HomePage/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomePageController());
  }
}
