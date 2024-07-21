import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/verify_otp/controllers/verify_otp_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpPage extends StatelessWidget {
  final VerifyOtpController _controller = Get.put(VerifyOtpController());
  final SignUpController signupController = Get.find<SignUpController>();

  VerifyOtpPage({superKey, Key? key}); // Register the controller

  @override
  Widget build(BuildContext context) {
    RxString enteredOtp = ''.obs; // Variable to store entered OTP
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const SizedBox(
                height: 150,
              ),
              Text(
                'Verification',
                style: GoogleFonts.inter(
                  fontSize: 24.0,
                  color: const Color(0xFF15224F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter your OTP code number",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: const Color(0xFF969AA8),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(context, first: true, last: false),
                        _textFieldOTP(context, first: false, last: false),
                        _textFieldOTP(context, first: false, last: false),
                        _textFieldOTP(context, first: false, last: false),
                        _textFieldOTP(context, first: false, last: false),
                        _textFieldOTP(context, first: false, last: true),
                      ],
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (enteredOtp.value.length != 6) {
                            Get.snackbar('Error', 'Please enter a 6-digit OTP');
                          } else {
                            _controller.verifyOtp(
                                signupController
                                    .phoneNumberController.value.text,
                                enteredOtp.value);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Didn't you receive any code?",
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: const Color(0xFF969AA8),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  _controller.resendOtp();
                },
                child: Text(
                  "Resend New Code",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(BuildContext context,
      {required bool first, required bool last}) {
    return SizedBox(
      height: 60,
      width: 40,
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
