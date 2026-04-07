import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:saidpure_service/ServiceList/service_list_controller.dart';
import 'package:saidpure_service/utils/routes.dart';

class ServiceList extends GetView<ServiceListController> {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.category)),
      body: Obx(() => ListView.builder(
            itemCount: controller.services.length,
            itemBuilder: (context, index) {
              var item = controller.services[index];

              return ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text(item["name"]),
                subtitle: Text("⭐ ${item["rating"]} • ${item["distance"]}"),
                trailing: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.Booking,
                      arguments: item,
                    );
                  },
                  child: Text("Book"),
                ),
              );
            },
          )),
    );
  }
}