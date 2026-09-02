import 'package:ecomly_frontend/ui/authentication/widgets/account_registration_screen.dart';
import 'package:flutter/material.dart';

import 'ui/core/onboarding/onboarding_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/account_registration': (context) => AccountRegistrationScreen(),
      },
      initialRoute: '/onboarding',
      title: 'Ecomly',
    ),
  );
}
