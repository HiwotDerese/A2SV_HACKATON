import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/presentation/onboarding/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Container(
      // height: 45.0,
      // width: 140.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.0),
          ),
          backgroundColor: Color.fromARGB(255, 215, 187, 4),
        ),
        onPressed: () {
          Get.offNamed(RoutesName.signUp);
        },
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              "GET STARTED",
              style: TextStyle(
                fontFamily: Constants.POPPINS,
                fontWeight: FontWeight.w700,
                fontSize: 13.0,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
