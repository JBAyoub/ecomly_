import 'package:ecomly_frontend/ui/core/shared_ui/buttons/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_facebook_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_google_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/or_divider.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            spacing: 10,
            crossAxisAlignment: .stretch,
            children: [
              Text("Login to your account", style: textTheme.headlineLarge),
              Text(
                "It's great to see you again.",
                style: textTheme.bodyLarge?.copyWith(color: AppColors.grey3),
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
                        Text(
                          'Forgot your password?',
                          style: textTheme.bodyMedium,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/forgot-password');
                          },
                          child: Text(
                            'Reset your password.',
                            style: textTheme.bodyMedium?.copyWith(
                              decoration: .underline,
                              fontWeight: .w600,
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
                    const SizedBox(height: 10),

                    LoginWithGoogleButton(buttonText: 'Log in'),
                    const SizedBox(height: 5),
                    LoginWithFacebookButton(buttonText: 'Log in'),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: .center,
                mainAxisSize: .min,
                children: [
                  Text(
                    "Don't have an account?",
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.grey2,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/account_registration');
                    },
                    child: Text(
                      'Join',
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: .w600,
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
