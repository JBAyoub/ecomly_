import 'package:ecomly_frontend/ui/core/shared_ui/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
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
                    Text("Forgot Password", style: textTheme.displayLarge),
                    const SizedBox(height: 10),
                    Text(
                      "Enter your email for the verification process.",
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey3,
                      ),
                    ),
                    Text(
                      "We will send 4 digits code to your email.",
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey3,
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
                      onPressed: _isEmailValid
                          ? () {
                              Navigator.of(context).pushNamed(
                                '/enter-code',
                                arguments: {'email': _emailController.text},
                              );
                            }
                          : null,
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
