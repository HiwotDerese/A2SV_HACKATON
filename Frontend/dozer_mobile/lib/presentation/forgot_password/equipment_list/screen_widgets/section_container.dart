

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionContainer extends StatelessWidget {
  final String sectionName;
  final RxBool isSelected; // Using RxBool for observability
  final VoidCallback onPressed;

  SectionContainer({
    required this.sectionName,
    required bool initialSelected, // Use a regular bool for initial value
    required this.onPressed,
  }) : isSelected = initialSelected.obs; // Convert to RxBool

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isSelected.value ? Color.fromARGB(255, 52, 53, 53) : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            sectionName,
            style: TextStyle(
              color: isSelected.value ? Colors.white : Colors.black,
              fontWeight: isSelected.value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
