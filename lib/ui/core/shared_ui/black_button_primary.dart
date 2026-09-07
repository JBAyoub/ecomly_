import 'package:ecomly_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BlackButtonPrimary extends StatelessWidget {
  final String buttonText;
  final IconData? iconData;
  final VoidCallback? onPressed;
  const BlackButtonPrimary({
    super.key,
    required this.buttonText,
    this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        disabledBackgroundColor: AppColors.grey3.withAlpha(100),
        disabledForegroundColor: AppColors.white,
        padding: const EdgeInsets.all(20),
        visualDensity: .comfortable,
        backgroundColor: AppColors.black1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: .center,
        spacing: 10,
        children: [
          Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: AppColors.grey5),
          ),
          if (iconData != null) Icon(iconData),
        ],
      ),
    );
  }
}
