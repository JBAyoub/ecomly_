import 'package:ecomly_frontend/ui/core/shared_ui/black_button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const new({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final Widget decorationLines = SvgPicture.asset(
    'assets/vector_images/lines_decoration.svg',
    semanticsLabel: 'Black lines',
    alignment: .centerLeft,
    renderingStrategy: .raster,
    clipBehavior: .antiAlias,
    colorFilter: ColorFilter.mode(
      const Color.fromARGB(221, 190, 188, 188),
      BlendMode.srcIn,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        child: Stack(
          children: [
            Container(color: const Color.fromARGB(255, 246, 246, 246)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Text(
                'Define yourself in your unique way.',
                softWrap: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: .none,
                  fontFamily: 'GeneralSans',
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: .w700,
                  height: 1,
                ),
              ),
            ),
            Positioned.fill(top: 100, left: 0, child: decorationLines),
            Positioned(
              right: 0,
              bottom: 100,
              child: SizedBox(
                width: 400,
                height: 650,
                child: ClipRect(
                  child: Transform.scale(
                    scale: 1.3,
                    child: Image.asset(
                      'assets/vector_images/male_model.png',
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BlackButtonPrimary(
                  buttonText: 'Get Started',
                  iconData: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/account_registration');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
