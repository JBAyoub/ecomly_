import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithFacebookButton extends StatelessWidget {
  LoginWithFacebookButton({super.key, required this.buttonText});
  final String buttonText;

  final Widget facebookLogo = SvgPicture.asset(
    'assets/vector_images/logos_facebook.svg',
    semanticsLabel: 'Facebook',
    renderingStrategy: .raster,
    clipBehavior: .antiAlias,
  );
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF1877F2),
        enableFeedback: true,
        visualDensity: .adaptivePlatformDensity,
        padding: const EdgeInsets.all(20),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        side: const BorderSide(
          width: 0.6,
          color: Color.fromARGB(255, 150, 150, 150),
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: .center,
        spacing: 10,
        children: [
          facebookLogo,
          Text(
            '$buttonText with Facebook',
            style: const TextStyle(fontFamily: 'GeneralSans'),
          ),
        ],
      ),
    );
  }
}
