import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
