import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/forgot_password/controllers/forgot_password_controller.dart';
import 'package:dozer_mobile/presentation/sign_up/screen_widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  final ResetPasswordController _resetPasswordController =
      Get.put(ResetPasswordController());

  ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Enter New Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please enter your new password.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => PasswordField(
                        errorText: _resetPasswordController.passwordError.value,
                        labelText: 'Password',
                        controller: _resetPasswordController.passwordController,
                        isPasswordVisible:
                            _resetPasswordController.passwordVisibility.value,
                        onTap: () => _resetPasswordController.togglePasswordVisibility(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => PasswordField(
                        errorText: _resetPasswordController.confirmPasswordError.value,
                        labelText: 'Confirm Password',
                        controller: _resetPasswordController.confirmPasswordController,
                        isPasswordVisible:
                            _resetPasswordController.confirmPasswordVisibility.value,
                        onTap: () => _resetPasswordController.toggleConfirmPasswordVisibility(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _resetPasswordController.resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Obx(() => _resetPasswordController.status.value ==
                              Status.loading
                          ? CircularProgressIndicator(
                              color: AppColors.white,
                            ) // Show circular progress indicator when loading
                          : const Text(
                              'Reset Password',
                              style: TextStyle(color: Colors.white),
                            )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
