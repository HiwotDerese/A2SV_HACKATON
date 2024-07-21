import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final String labelText;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.errorText,
    required this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black), // Set text color
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey), // Set label text color
        errorText: errorText.isNotEmpty ? errorText : null,
        errorStyle: const TextStyle(color: Colors.red), // Set error text color
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius
          borderSide: const BorderSide(color: Colors.amber, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        hintText: labelText, // Show label text as hint when field is empty
        hintStyle: const TextStyle(color: Colors.grey), // Set hint text color
      ),
    );
  }
}