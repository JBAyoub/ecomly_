import 'package:ecomly_frontend/ui/core/shared_ui/animations/success_animation.dart';
import 'package:ecomly_frontend/ui/core/shared_ui/buttons/black_button_primary.dart';
import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessModal extends StatelessWidget {
  final String title;
  final String message;
  final bool hasButton;
  final String? buttonText;

  const SuccessModal({
    super.key,
    required this.title,
    required this.message,
    required this.hasButton,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SuccessAnimation(),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: AppColors.grey3),
            ),
            const SizedBox(height: 24),
            if (hasButton)
              BlackButtonPrimary(
                buttonText: buttonText ?? '',
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed('/login'),
              ),
          ],
        ),
      ),
    );
  }
}
