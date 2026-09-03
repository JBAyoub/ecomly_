import 'package:ecomly_frontend/ui/core/shared_ui/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_facebook_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_google_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/or_divider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool get _isFormValid => _isEmailValid && _isPasswordValid;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                "Login to your account",
                style: TextStyle(
                  fontFamily: 'GeneralSans',
                  fontWeight: .w600,
                  fontSize: 32,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
              ),
              Text(
                "It's great to see you again.",
                style: TextStyle(
                  fontFamily: 'GeneralSans',
                  fontWeight: .w300,
                  fontSize: 16,
                  letterSpacing: 0,
                  wordSpacing: 0,
                  color: const Color.fromARGB(200, 1, 1, 1),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                child: Column(
                  mainAxisSize: .max,
                  spacing: 10,
                  children: [
                    CustomFormField(
                      fieldController: emailController,
                      hint: 'Enter your email address',
                      labelText: 'Email',
                      textInputType: .emailAddress,
                      onValidityChanged: (isValid) =>
                          setState(() => _isEmailValid = isValid),
                    ),
                    CustomFormField(
                      fieldController: passwordController,
                      hint: 'Enter your password',
                      labelText: 'Password',
                      hideText: true,
                      isPassword: true,
                      onValidityChanged: (isValid) =>
                          setState(() => _isPasswordValid = isValid),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontWeight: .normal,
                            fontFamily: 'GeneralSans',
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Reset your password.',
                            style: TextStyle(
                              fontWeight: .w600,
                              fontSize: 15,
                              fontFamily: 'GeneralSans',
                              color: Color(0xFF000000),
                              decoration: .underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlackButtonPrimary(
                      buttonText: 'Login',
                      onPressed: _isFormValid ? onLoginClicked : null,
                    ),
                    const SizedBox(height: 10),
                    const OrDivider(),
                    LoginWithGoogleButton(buttonText: 'Log in'),
                    LoginWithFacebookButton(buttonText: 'Log in'),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: .center,
                mainAxisSize: .min,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: .normal,
                      fontFamily: 'GeneralSans',
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Join',
                      style: TextStyle(
                        fontWeight: .w600,
                        fontSize: 15,
                        fontFamily: 'GeneralSans',
                        color: Color(0xFF000000),
                        decoration: .underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginClicked() {
    // final email = emailController.text.trim();
    // final password = emailController.text.trim();
    //proceed to API call
  }
}
