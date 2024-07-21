import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authRepository;

  LoginController({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Rx<Status> status = Status.completed.obs;
  final RxString phoneNumberError = RxString('');
  final RxString passwordError = RxString('');
  final RxBool passwordVisibility = true.obs;

  bool get isLoginEnabled =>
      phoneNumberController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      phoneNumberError.value.isEmpty &&
      passwordError.value.isEmpty;

  void togglePasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  void validatePhoneNumber(String value) {
    // Regular expression for phone number validation
    final phoneRegex = RegExp(r'^(?:\+?251|0)?9[0-9]{8}$');
    if (value.isEmpty) {
      phoneNumberError.value = 'Phone number cannot be empty';
    } else if (!phoneRegex.hasMatch(value)) {
      phoneNumberError.value = 'Enter a valid phone number';
    } else {
      phoneNumberError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else {
      passwordError.value = '';
    }
  }

  Future<void> login() async {
    try {
      if (!isLoginEnabled) {
        Get.snackbar('Error', 'Please enter phone number and password');
        return;
      }
      status(Status.loading);
      print(phoneNumberController.text.trim());
      print(passwordController.text.trim());

      final response = await _authRepository.login(
        phoneNumberController.text.trim(),
        passwordController.text.trim(),
      );
      print(response);
      print('333333333');
      if (response) {
        Get.toNamed(RoutesName.home);
      } else {
        Get.snackbar(
            'Error', 'Failed to login. Please check your credentials.');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
      );
    } finally {
      status(Status.completed);
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
