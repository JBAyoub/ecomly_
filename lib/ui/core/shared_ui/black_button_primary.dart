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
        disabledBackgroundColor: const Color.fromARGB(100, 0, 0, 0),

        visualDensity: .comfortable,
        elevation: 2,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
            style: TextStyle(fontFamily: 'GeneralSans', fontSize: 18),
          ),
          Icon(iconData),
        ],
      ),
    );
  }
}
