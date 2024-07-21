import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final AuthenticationRepository _repository = AuthenticationRepository();
  final Rx<Status> verificationStatus = Status.completed.obs;
  final SignUpController signUpController = Get.find<SignUpController>();

  // Method to verify OTP
  Future<void> verifyOtp(String phoneNumber, String code) async {
    try {
      verificationStatus(Status.loading);
      debugPrint(phoneNumber);
      debugPrint(code);
      final bool isVerified = await _repository.verifyOtp(phoneNumber, code);

      if (isVerified) {
        print('OTP verified successfully $isVerified');
        registerUser();
      } else {
        Get.snackbar('Error', 'Failed to verify OTPp');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP: $e');
    }
  }

  // Method to register user
  Future<void> registerUser() async {
    try {
      verificationStatus(Status.loading);

      final registered = await _repository.registerUser(
        signUpController.phoneNumberController.value.text,
        signUpController.emailController.value.text,
        signUpController.passwordController.value.text,
        signUpController.firstNameController.value.text,
        signUpController.lastNameController.value.text,
      );

      if (registered) {
        verificationStatus(Status.completed);
        Get.offNamed(RoutesName.home);
      }
    } catch (error) {
      verificationStatus(Status.error);
      // debugPrint('Error: $error');
      Get.snackbar('Error', '$error');
    }
  }

  Future<void> resendOtp() async {
    try {
      verificationStatus(Status.loading);
      final bool isResent = await _repository
          .resendOtp(signUpController.phoneNumberController.value.text.trim());
      if (isResent) {
        verificationStatus(Status.completed);
        Get.snackbar('Resend', 'Code resent successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Failed to resend OTP');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to resend OTP: $e');
    }
  }
}
