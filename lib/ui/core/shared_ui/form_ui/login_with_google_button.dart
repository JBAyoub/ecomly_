import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithGoogleButton extends StatelessWidget {
  LoginWithGoogleButton({super.key, required this.buttonText});
  final String buttonText;
  final Widget googleLogo = SvgPicture.asset(
    'assets/vector_images/logos_google-icon.svg',
    semanticsLabel: 'Google',
    renderingStrategy: .raster,
    clipBehavior: .antiAlias,
  );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        enableFeedback: true,
        visualDensity: .adaptivePlatformDensity,
        padding: const EdgeInsets.all(20),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
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
          googleLogo,
          Text(
            '$buttonText with Google',
            style: TextStyle(fontFamily: 'GeneralSans'),
          ),
        ],
      ),
    );
  }
}
