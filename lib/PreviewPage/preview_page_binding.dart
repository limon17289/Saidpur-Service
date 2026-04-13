import 'package:get/get.dart';
import 'package:saidpure_service/PreviewPage/preview_page_controller.dart';

class PreviewPageBinding extends Bindings {
   @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>PreviewPageController());
  }
}
