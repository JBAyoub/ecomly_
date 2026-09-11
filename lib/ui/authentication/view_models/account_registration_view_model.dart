import 'package:flutter/material.dart';

class AccountRegistrationViewModel with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool get isFormValid => _isNameValid && _isEmailValid && _isPasswordValid;
  void onCreateAccountPress() {
    // final email = emailController.text.trim();
    // final password = passwordController.text.trim();
    // Proceed with registration API call/navigation
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void updateNameValidity(bool isValid) {
    _isNameValid = isValid;
    notifyListeners();
  }

  void updateEmailValidity(bool isValid) {
    _isEmailValid = isValid;
    notifyListeners();
  }

  void updatePasswordValidity(bool isValid) {
    _isPasswordValid = isValid;
    notifyListeners();
  }
}
