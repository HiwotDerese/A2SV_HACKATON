


import 'package:dozer_mobile/presentation/announcement_screen/controller/announcement_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AnnouncementBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AnnouncementController.new);
  }
}
