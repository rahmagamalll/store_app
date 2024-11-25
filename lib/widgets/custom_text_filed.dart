import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFild extends StatelessWidget {
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  TextInputType textInputType;
  CustomTextFormFild(
      {super.key,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText is required.';
        }
        return null;
      },
      obscureText: obscureText!,
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        errorStyle: const TextStyle(fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 237, 235, 235), width: 45),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 220, 236, 249),
            width: 50,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 243, 157, 157),
            width: 45,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 251, 220, 218),
            width: 50,
          ),
        ),
      ),
    );
  }
}
