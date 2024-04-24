import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText, // Add this line
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText; // Add this line

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15.0), // Bo tròn các góc
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15.0), // Bo tròn các góc
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
