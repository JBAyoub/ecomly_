import 'package:ecomly_frontend/ui/core/shared_ui/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isEmailValid = false;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontFamily: 'GeneralSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Enter your email for the verification process.",
                      style: TextStyle(
                        fontFamily: 'GeneralSans',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: const Color.fromARGB(150, 1, 1, 1),
                      ),
                    ),

                    Text(
                      "We will send 4 digits code to your email.",
                      style: TextStyle(
                        fontFamily: 'GeneralSans',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: const Color.fromARGB(150, 1, 1, 1),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Form(
                      key: _formKey,
                      child: CustomFormField(
                        fieldController: _emailController,
                        hint: 'Enter your email address.',
                        labelText: 'Email',
                        onValidityChanged: (isValid) {
                          setState(() {
                            _isEmailValid = isValid;
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 20),
                    BlackButtonPrimary(
                      buttonText: 'Send Code',
                      onPressed: _isEmailValid ? sendCode : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void sendCode() {
  // logic for sendingCode in here
}
