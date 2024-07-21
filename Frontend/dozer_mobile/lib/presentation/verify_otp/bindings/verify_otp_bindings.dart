import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:dozer_mobile/presentation/verify_otp/controllers/verify_otp_controller.dart';
import 'package:get/get.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController());
    Get.lazyPut(() => SignUpController());
  }
}
