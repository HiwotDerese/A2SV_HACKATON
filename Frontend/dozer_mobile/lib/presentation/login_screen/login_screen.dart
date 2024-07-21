import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/data/repositories/auth_repository.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/presentation/login_screen/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/sign_up/screen_widgets/password_text_field.dart';
import 'package:dozer_mobile/core/utils/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController =
      Get.put(LoginController(authRepository: AuthenticationRepository()));

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // to give space from top
            const Expanded(
              flex: 1,
              child: Center(),
            ),

            // page content here
            Expanded(
              flex: 9,
              child: buildCard(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // header text
                  Text(
                    'Login',
                    style: GoogleFonts.inter(
                      fontSize: 24.0,
                      color: const Color(0xFF15224F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Welcome back!',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: const Color(0xFF969AA8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),

                  // form fields
                  Obx(
                    () => CustomTextField(
                      controller: _loginController.phoneNumberController,
                      errorText: _loginController.phoneNumberError.value,
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => PasswordField(
                      errorText: _loginController.passwordError.value,
                      labelText: 'Password',
                      controller: _loginController.passwordController,
                      isPasswordVisible:
                          _loginController.passwordVisibility.value,
                      onTap: _loginController.togglePasswordVisibility,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // login button
                  ElevatedButton(
                    onPressed: _loginController.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      minimumSize: Size(size.width, size.height / 11),
                    ),
                    child: Obx(
                      () => _loginController.status.value == Status.loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Login',
                              style: GoogleFonts.inter(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),

                  // footer section
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.forgotPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF3B4C68),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
