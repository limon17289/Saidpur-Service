import 'package:get/get.dart';
import 'package:saidpure_service/ServiceList/service_list_controller.dart';

class ServiceListBinding  extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ServiceListController());
  }
}