import 'package:dozer_mobile/dozer_exports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfilePictureController extends GetxController {
  final picker = ImagePicker();
  final imagePath = RxString('');

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Set the imagePath to the path of the selected image
      imagePath.value = pickedFile.path;
    } else {
      // Handle if no image is picked
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
    }
  }
}
