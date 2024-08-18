import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:flutter/material.dart';

class NotifyOwnerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NotifyOwnerButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: primaryColor
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
