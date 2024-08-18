import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:dozer_mobile/presentation/verify_otp/controllers/verify_otp_controller.dart';

class VerifyOtpPage extends StatelessWidget {
  final VerifyOtpController _controller = Get.put(VerifyOtpController());
  final SignUpController signupController = Get.find<SignUpController>();

  VerifyOtpPage({superKey, Key? key}); // Register the controller

  @override
  Widget build(BuildContext context) {
    RxString enteredOtp = ''.obs; // Variable to store entered OTP

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter your phone number and the 6-digit code sent to you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: OtpPinField(
                          textInputAction: TextInputAction.done,
                          maxLength: 6,
                          fieldWidth: 40,
                          onSubmit: (text) {
                            enteredOtp.value = text; // Capture entered OTP
                          },
                          onChange: (text) {},
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (enteredOtp.value.length != 6) {
                            Get.snackbar('Error', 'Please enter a 6-digit OTP');
                          } else {
                            _controller.verifyOtp(
                                signupController
                                    .phoneNumberController.value.text,
                                enteredOtp.value);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 188, 51),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Verify',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          _controller.resendOtp();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Could not receive the code? ',
                              style: TextStyle(
                                color: AppColors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            const Text(
                              'Resend',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
