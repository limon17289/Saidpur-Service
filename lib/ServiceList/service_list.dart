import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saidpure_service/ServiceList/service_list_controller.dart';
import 'package:saidpure_service/utils/routes.dart';

class ServiceList extends GetView<ServiceListController> {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(controller.category),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.services.length,
          itemBuilder: (context, index) {
            var item = controller.services[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),

              child: Row(
                children: [
                  /// Avatar
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: const Icon(Icons.person, color: Colors.blue),
                  ),

                  const SizedBox(width: 12),

                  /// Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "⭐ ${item["rating"]} • ${item["distance"]}",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(
                        Routes.Booking,
                        arguments: item,
                      );
                    },
                    child: const Text("Book"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}