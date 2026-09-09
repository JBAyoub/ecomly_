import 'package:ecomly_frontend/ui/authentication/widgets/account_registration_screen.dart';
import 'package:ecomly_frontend/ui/authentication/widgets/create_new_password.dart';
import 'package:ecomly_frontend/ui/authentication/widgets/enter_code.dart';
import 'package:ecomly_frontend/ui/authentication/widgets/forgot_password_screen.dart';
import 'package:ecomly_frontend/ui/authentication/widgets/login_screen.dart';
import 'package:ecomly_frontend/ui/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'ui/core/onboarding/onboarding_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/account_registration': (context) => AccountRegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/enter-code': (context) => EnterCodeScreen(),
        '/create-new-password': (context) => CreateNewPasswordScreen(),
      },
      initialRoute: '/create-new-password',
      title: 'Ecomly',
    ),
  );
}
