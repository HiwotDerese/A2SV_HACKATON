import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Rx<Status> status = Status.completed.obs;
  final RxString passwordError = RxString('');
  final RxString confirmPasswordError = RxString('');

  final RxBool passwordVisibility = false.obs;
  final RxBool confirmPasswordVisibility = false.obs;

  bool get isResetEnabled =>
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty &&
      passwordError.value.isEmpty &&
      confirmPasswordError.value.isEmpty &&
      passwordController.text == confirmPasswordController.text;

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'Confirm Password cannot be empty';
    } else if (value != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  Future<void> resetPassword() async {
    try {
      if (!isResetEnabled) return;

      status(Status.loading);

      final response = await _authRepository.resetPassword(
        passwordController.text.trim(),
      );

      if (response) {
        Get.snackbar('Success', 'Password reset successful',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.toNamed(
            RoutesName.login); // Redirect to login page after password reset
      } else {
        Get.snackbar('Error', 'Failed to reset password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      status(Status.completed);
    }
  }

  void togglePasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisibility.value = !confirmPasswordVisibility.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
