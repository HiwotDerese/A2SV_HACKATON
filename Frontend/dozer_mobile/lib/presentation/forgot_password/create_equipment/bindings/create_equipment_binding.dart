import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:get/get.dart';

class CreateEquipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EquipmentController.new);
  }
}