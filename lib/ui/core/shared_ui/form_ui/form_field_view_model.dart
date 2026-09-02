import 'package:flutter/material.dart';

class FormFieldViewModel {
  Widget? buildSuffixIcon({
    required bool? isFieldValid,
    required bool isPassword,
    required bool hideText,
    required VoidCallback onPressed,
  }) {
    if (isPassword) {
      return IconButton(
        color: const Color.fromARGB(100, 0, 0, 0),
        icon: Icon(
          hideText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        ),
        onPressed: onPressed,
      );
    }
    if (isFieldValid == null) return null;
    return isFieldValid
        ? const Icon(
            Icons.check_circle_outline_sharp,
            fontWeight: .bold,
            color: Color(0xFF0C9409),
          )
        : const Icon(
            Icons.error_outline_rounded,
            color: Color.fromARGB(200, 255, 0, 0),
          );
  }
}
