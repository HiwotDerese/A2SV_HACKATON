import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:dozer_mobile/presentation/create_equipment/repository/create_equipment_repository.dart';
import 'package:get/get.dart';

class CreateEquipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EquipmentController(repository: EquipmentRepository()));
  }
}
