import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_facebook_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_google_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/or_divider.dart';
import 'package:flutter/material.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool get _isFormValid => _isNameValid && _isEmailValid && _isPasswordValid;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onCreateAccountPress() {
    // final email = emailController.text.trim();
    // final password = passwordController.text.trim();
    // Proceed with registration API call/navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: .max,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    fontWeight: .w600,
                    fontSize: 32,
                    letterSpacing: 0,
                    wordSpacing: 0,
                  ),
                ),
                Text(
                  "Let's create your account.",
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    fontWeight: .w300,
                    fontSize: 16,
                    letterSpacing: 0,
                    wordSpacing: 0,
                    color: const Color.fromARGB(200, 1, 1, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 15,
                    children: [
                      CustomFormField(
                        fieldController: nameController,
                        hint: 'Enter your full name',
                        labelText: "Full Name",
                        textInputType: .name,
                        hideText: false,
                        onValidityChanged: (isValid) =>
                            setState(() => _isNameValid = isValid),
                      ),

                      CustomFormField(
                        fieldController: emailController,
                        hint: 'Enter your email adress',
                        labelText: "Email",
                        textInputType: .emailAddress,
                        hideText: false,
                        onValidityChanged: (isValid) =>
                            setState(() => _isEmailValid = isValid),
                      ),
                      CustomFormField(
                        fieldController: passwordController,
                        hint: 'Enter your password',
                        labelText: "Password",
                        textInputType: .visiblePassword,
                        hideText: true,
                        isRegistration: true,
                        isPassword: true,
                        onValidityChanged: (isValid) =>
                            setState(() => _isPasswordValid = isValid),
                      ),
                      const Text(
                        'By signing up you agree to our Terms, Privacy Policy, and Cookie Use',
                        style: TextStyle(
                          fontWeight: .normal,
                          fontFamily: 'GeneralSans',
                          fontSize: 15,
                        ),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          enableFeedback: true,
                          padding: const EdgeInsets.all(20),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                          disabledBackgroundColor: const Color.fromARGB(
                            150,
                            149,
                            149,
                            149,
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: _isFormValid ? _onCreateAccountPress : null,
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontFamily: 'GeneralSans',
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const OrDivider(),
                      LoginWithGoogleButton(buttonText: 'Sign up'),
                      LoginWithFacebookButton(buttonText: 'Sign up'),
                      Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,

                              color: const Color(0x92000000),
                              fontFamily: 'GeneralSans',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontWeight: .w600,
                                fontSize: 16,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
