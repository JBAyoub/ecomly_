import 'package:ecomly_frontend/ui/core/shared_ui/buttons/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/dialogs/success_modal.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool get passwordMatch =>
      _passwordController.text == _confirmPasswordController.text;

  bool get shouldShowPasswordError =>
      _confirmPasswordController.text.isNotEmpty && !passwordMatch;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {});
    });
    _confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .start,
          children: [
            Text('Reset Password', style: textTheme.displayLarge),
            const SizedBox(height: 10),
            Text(
              'Set the new password for your account so you can login and access all the features.',
              style: textTheme.bodyLarge?.copyWith(color: AppColors.grey2),
            ),
            CustomFormField(
              fieldController: _passwordController,
              hint: 'Enter your new password',
              labelText: 'Password',
              isPassword: true,
              hideText: true,
            ),
            const SizedBox(height: 10),
            CustomFormField(
              fieldController: _confirmPasswordController,
              hint: 'Re-enter your new password',
              labelText: 'Password',
              isPassword: true,
              hideText: true,
            ),

            if (shouldShowPasswordError)
              Text(
                textAlign: .end,
                'Passwords do not match!',
                style: textTheme.bodyLarge?.copyWith(color: AppColors.warning),
              ),
            Spacer(),

            BlackButtonPrimary(
              buttonText: 'Continue',
              onPressed:
                  passwordMatch &&
                      _passwordController.text.isNotEmpty &&
                      _confirmPasswordController.text.isNotEmpty
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessModal(
                            hasButton: true,
                            buttonText: 'Login',
                            title: 'Password Changed!',
                            message: 'You can now use your new password to login to your account.',
                          );
                        },
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
