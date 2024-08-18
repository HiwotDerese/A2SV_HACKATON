

import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';

import 'package:get/get.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(BookingController.new);
  }
}
