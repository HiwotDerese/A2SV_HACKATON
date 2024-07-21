import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
  
    required this.isPasswordVisible,
    required this.onTap,
    required this.controller,
    required this.errorText,
    required this.labelText,
    // required this.onChanged, // Add onChanged parameter
  });

  final bool isPasswordVisible;
  final VoidCallback? onTap;
  final TextEditingController controller;
  final String errorText;
  final String labelText;
  // final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordVisible,
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      // onChanged: onChanged, // Call onChanged method
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
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: onTap,
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ), // Set hint text color
      ),
    );
  }
}
