import 'package:dozer_mobile/presentation/add_profile_photo/controllers/pick_image_controller.dart';
import 'package:get/get.dart';

class ProfilePictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePictureController());
  }
}