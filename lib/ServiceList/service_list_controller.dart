import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ServiceListController extends GetxController {
  // var services = [].obs;
  // var category = "";

 
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



//   import 'package:get/get.dart';

// class ServiceListController extends GetxController {
  var category = "";
  var services = [].obs;

  final allServices = [
    {
      "name": "Rahim Cleaning",
      "category": "Cleaning",
      "rating": 4.5,
      "distance": "2 km"
    },
    {
      "name": "Karim Cleaning Pro",
      "category": "Cleaning",
      "rating": 4.2,
      "distance": "3 km"
    },
    {
      "name": "Jamal Plumber",
      "category": "Plumbing",
      "rating": 4.7,
      "distance": "1.5 km"
    },
    {
      "name": "Electric Master",
      "category": "Electric",
      "rating": 4.3,
      "distance": "2 km"
    },
    {
      "name": "AC Repair Expert",
      "category": "AC Repair",
      "rating": 4.6,
      "distance": "1 km"
    },
    {
      "name": "Painting Pro",
      "category": "Painting",
      "rating": 4.1,
      "distance": "3 km"
    },
    {
      "name": "Car Wash Center",
      "category": "Car Wash",
      "rating": 4.4,
      "distance": "2.5 km"
    },
  ];

  @override
  void onInit() {
    super.onInit();
category = Get.arguments;

    fetchServices();
    category = Get.arguments ?? "";

    filterData();
  }

  void filterData() {
    services.value = allServices
        .where((e) =>
            e["category"].toString().toLowerCase() ==
            category.toString().toLowerCase())
        .toList();
  }
}
