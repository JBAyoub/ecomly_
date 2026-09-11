import 'package:ecomly_frontend/ui/authentication/view_models/login_screen_view_model.dart';
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
  late final LoginScreenViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginScreenViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      "Login to your account",
                      style: textTheme.headlineLarge,
                    ),
                    Text(
                      "It's great to see you again.",
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisSize: .max,
                      spacing: 10,
                      children: [
                        CustomFormField(
                          fieldController: _viewModel.emailController,
                          hint: 'Enter your email address',
                          labelText: 'Email',
                          textInputType: .emailAddress,
                          onValidityChanged: (isValid) =>
                              _viewModel.updateEmailValidity(isValid),
                        ),
                        CustomFormField(
                          fieldController: _viewModel.passwordController,
                          hint: 'Enter your password',
                          labelText: 'Password',
                          hideText: true,
                          isPassword: true,
                          onValidityChanged: (isValid) =>
                              _viewModel.updatePasswordValidity(isValid),
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
                                Navigator.of(context)
                                    .pushNamed('/forgot-password');
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
                        ListenableBuilder(
                          listenable: _viewModel,
                          builder: (context, child) {
                            return BlackButtonPrimary(
                              buttonText: 'Login',
                              onPressed: _viewModel.isFormValid
                                  ? () {
                                      _viewModel.onLoginPress(context);
                                    }
                                  : null,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const OrDivider(),
                        const SizedBox(height: 10),

                        LoginWithGoogleButton(buttonText: 'Log in'),
                        const SizedBox(height: 5),
                        LoginWithFacebookButton(buttonText: 'Log in'),
                      ],
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
                            Navigator.of(context)
                                .pushNamed('/account_registration');
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
          ],
        ),
      ),
    );
  }
}
