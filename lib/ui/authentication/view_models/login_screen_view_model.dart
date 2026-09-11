import 'package:ecomly_frontend/ui/core/shared_ui/dialogs/success_modal.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool get isFormValid => _isEmailValid && _isPasswordValid;

  void updateEmailValidity(bool isValid) {
    _isEmailValid = isValid;
    notifyListeners();
  }

  void updatePasswordValidity(bool isValid) {
    _isPasswordValid = isValid;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLoginPress(BuildContext c) {
    showDialog(
      context: c,
      builder: (c) => SuccessModal(
        title: 'Login Success',
        message: 'You have successfully logged in.',
        hasButton: true,
        buttonText: 'Return',
      ),
    );
  }
}
