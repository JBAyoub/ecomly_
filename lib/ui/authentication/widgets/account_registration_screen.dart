import 'package:ecomly_frontend/ui/authentication/view_models/account_registration_view_model.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/buttons/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_facebook_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/login_with_google_button.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/or_divider.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  late final AccountRegistrationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AccountRegistrationViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final _colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: .onDrag,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: .max,
                  children: [
                    Text("Create an account", style: textTheme.headlineLarge),
                    Text(
                      "Let's create your account.",
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.grey5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 15,
                      children: [
                        CustomFormField(
                          fieldController: _viewModel.nameController,
                          hint: 'Enter your full name',
                          labelText: "Full Name",
                          textInputType: .name,
                          hideText: false,
                          onValidityChanged: (isValid) =>
                              _viewModel.updateNameValidity(isValid),
                        ),
                        CustomFormField(
                          fieldController: _viewModel.emailController,
                          hint: 'Enter your email adress',
                          labelText: "Email",
                          textInputType: .emailAddress,
                          hideText: false,
                          onValidityChanged: (isValid) =>
                              _viewModel.updateEmailValidity(isValid),
                        ),
                        CustomFormField(
                          fieldController: _viewModel.passwordController,
                          hint: 'Enter your password',
                          labelText: "Password",
                          textInputType: .visiblePassword,
                          hideText: true,
                          isRegistration: true,
                          isPassword: true,
                          onValidityChanged: (isValid) =>
                              _viewModel.updatePasswordValidity(isValid),
                        ),
                        Text(
                          'By signing up you agree to our Terms, Privacy Policy, and Cookie Use',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.black1,
                          ),
                        ),
                        ListenableBuilder(
                          listenable: _viewModel,
                          builder: (BuildContext context, Widget? child) {
                            return BlackButtonPrimary(
                              buttonText: 'Create an account',
                              onPressed: _viewModel.isFormValid
                                  ? () {
                                      Navigator.of(context).pushNamed('/login');
                                    }
                                  : null,
                            );
                          },
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
                              style: textTheme.bodyLarge?.copyWith(
                                color: AppColors.grey3,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Log In',
                                style: textTheme.bodyLarge?.copyWith(
                                  decoration: .underline,
                                  fontWeight: .w500,
                                ),
                              ),
                            ),
                          ],
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
