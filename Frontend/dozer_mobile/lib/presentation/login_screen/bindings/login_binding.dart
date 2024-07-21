import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/presentation/login_screen/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authRepository: AuthenticationRepository()));
  }
}
