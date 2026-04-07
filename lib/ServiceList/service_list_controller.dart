import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ServiceListController extends GetxController {
  var services = [].obs;
  var category = "";

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments;

    fetchServices();
  }

  void fetchServices() {
    // dummy data
    services.value = [
      {
        "name": "Rahim Plumber",
        "rating": 4.5,
        "distance": "2 km"
      },
      {
        "name": "Karim Plumber",
        "rating": 4.2,
        "distance": "3 km"
      },
    ];
  }
}