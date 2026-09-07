import 'package:ecomly_frontend/ui/core/shared_ui/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});
  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  bool get otpFilled =>
      _controllers.every((element) => element.text.isNotEmpty);
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (final controller in _controllers) {
      controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final args =
    //  ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final email = args['email'] as String;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text("Enter 4 Digit Code", style: textTheme.displayLarge),
            const SizedBox(height: 10),
            Text(
              "Enter the 4 digit code that we sent to your email or phone",
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey2),
            ),
            const SizedBox(height: 10),
            Form(
              child: Row(
                mainAxisAlignment: .center,
                spacing: 15,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    height: 64,
                    width: 64,
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      autofocus: index == 0,
                      keyboardType: TextInputType.number,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      onSaved: (pin) {},
                      onChanged: (value) {
                        if (value.length > 1) {
                          final digits = value.replaceAll(
                            RegExp(r'[^0-9]'),
                            '',
                          );
                          for (
                            int i = 0;
                            i < digits.length && index + i < 4;
                            i++
                          ) {
                            _controllers[index + i].text = digits[i];
                          }
                          final nextIndex = (index + digits.length).clamp(0, 3);
                          _focusNodes[nextIndex].requestFocus();
                          return;
                        }
                        // Normal single-digit typing.
                        if (value.length == 1 && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        }
                      },
                      maxLines: 1,
                      textAlign: .center,
                      style: const TextStyle(
                        fontFamily: 'GeneralSans',
                        fontSize: 26,
                        fontWeight: .w600,
                      ),
                      decoration: InputDecoration(
                        hintText: "0",
                        hintStyle: TextStyle(color: const Color(0x20000000)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: AppColors.grey5,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: AppColors.grey2,
                            width: 2,
                          ),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: .center,
              spacing: 0,
              children: [
                Text(
                  'Email not received?',
                  style: textTheme.titleSmall?.copyWith(color: AppColors.grey3),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: textTheme.titleSmall!.copyWith(
                      decoration: .underline,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            BlackButtonPrimary(
              buttonText: 'Continue',
              onPressed: otpFilled
                  ? () {
                      Navigator.of(context).pushNamed('/create-new-password');
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
