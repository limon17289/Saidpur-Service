import 'package:get/get.dart';
import 'package:saidpure_service/BookingScreen/booking_controller.dart';

class BookingBinding  extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>BookingController());
  }
}