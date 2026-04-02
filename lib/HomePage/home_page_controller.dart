import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
   var categories = [
    {"name": "Cleaning", "icon": Icons.cleaning_services},
    {"name": "Plumbing", "icon": Icons.plumbing},
    {"name": "Electric", "icon": Icons.electrical_services},
    {"name": "AC Repair", "icon": Icons.ac_unit},
    {"name": "Painting", "icon": Icons.format_paint},
    {"name": "Car Wash", "icon": Icons.local_car_wash},
  ];
}