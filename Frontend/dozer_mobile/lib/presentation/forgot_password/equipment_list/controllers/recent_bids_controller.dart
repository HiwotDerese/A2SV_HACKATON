import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:dozer_mobile/presentation/equipment_list/repository/construction_repository.dart';
import 'package:get/get.dart';


class RecentBidsController extends GetxController {
  final ConstructionMachineRepository _repository = ConstructionMachineRepository();
  RxList<ConstructionMachineModel> recentBids = <ConstructionMachineModel>[].obs;
  RxList<ConstructionMachineModel> categoryList = <ConstructionMachineModel>[].obs;
  Rx<Status> status = Status.loading.obs; // Add status
  Rx<Status> statusCategory = Status.loading.obs;

  @override
  void onInit() {
    super.onInit();
    loadRecommendedMachines();
  }

  void loadRecommendedMachines() async {
  try {
    status(Status.loading); // Set loading status
    final machines = await _repository.getRecommendedMachines();

    if (machines.isNotEmpty) {
      recentBids.assignAll(machines);
      status(Status.success); // Set success status
    } else {
      status(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
    }
  } catch (e) {
    status(Status.error); // Set error status
    print('Error loading recommended machines: $e');
  }
}
void loadRecommendedMachinesbyCategory(String category) async {
  try {
    statusCategory(Status.loading); // Set loading status
    final machines = await _repository.getMachinesByCategory(category);

    if (machines.isNotEmpty) {
      categoryList.assignAll(machines);
      status(Status.success); // Set success status
    } else {
      statusCategory(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
    }
  } catch (e) {
    statusCategory(Status.error); // Set error status
    print('Error loading recommended machines: $e');
  }
}

}

enum Status { loading, success, error }
