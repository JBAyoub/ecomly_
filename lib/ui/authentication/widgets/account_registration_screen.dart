import 'package:ecomly_frontend/ui/core/shared_ui/form_ui/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  final Widget googleLogo = SvgPicture.asset(
    'assets/vector_images/logos_google-icon.svg',
    semanticsLabel: 'Google',
    renderingStrategy: .raster,
    clipBehavior: .antiAlias,
  );
  final Widget facebookLogo = SvgPicture.asset(
    'assets/vector_images/logos_facebook.svg',
    semanticsLabel: 'Google',
    renderingStrategy: .raster,
    clipBehavior: .antiAlias,
  );
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isFormValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: .max,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    fontWeight: .w600,
                    fontSize: 32,
                    letterSpacing: 0,
                    wordSpacing: 0,
                  ),
                ),
                Text(
                  "Let's create your account.",
                  style: TextStyle(
                    fontFamily: 'GeneralSans',
                    fontWeight: .w300,
                    fontSize: 16,
                    letterSpacing: 0,
                    wordSpacing: 0,
                    color: const Color.fromARGB(200, 1, 1, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  autovalidateMode: .onUserInteractionIfError,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 15,
                    children: [
                      CustomFormField(
                        fieldController: nameController,
                        hint: 'Enter your full name',
                        labelText: "Full Name",
                        textInputType: .name,
                        hideText: false,
                      ),

                      CustomFormField(
                        fieldController: emailController,
                        hint: 'Enter your email adress',
                        labelText: "Email",
                        textInputType: .emailAddress,
                        hideText: false,
                      ),
                      CustomFormField(
                        fieldController: passwordController,
                        hint: 'Enter your password',
                        labelText: "Password",
                        textInputType: .visiblePassword,
                        hideText: true,
                        isPassword: true,
                      ),
                      const Text(
                        'By signing up you agree to our Terms, Privacy Policy, and Cookie Use',
                        style: TextStyle(
                          fontWeight: .normal,
                          fontFamily: 'GeneralSans',
                          fontSize: 15,
                        ),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          enableFeedback: true,
                          padding: const EdgeInsets.all(20),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(25),
                          ),
                          disabledBackgroundColor: const Color.fromARGB(
                            150,
                            149,
                            149,
                            149,
                          ),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: isFormValid
                            ? () {
                                Navigator.of(context)
                                    .popAndPushNamed('/onboarding');
                              }
                            : null,
                        child: const Text(
                          'Create an account',
                          style: TextStyle(
                            fontFamily: 'GeneralSans',
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(50, 10, 10, 10),
                              height: 10,
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                              fontFamily: 'GeneralSans',
                              fontSize: 16,
                              fontWeight: .w300,
                              color: Color.fromARGB(255, 5, 5, 5),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(50, 10, 10, 10),
                              height: 10,
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
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
                            const Text(
                              'Sign Up with Google',
                              style: TextStyle(fontFamily: 'GeneralSans'),
                            ),
                          ],
                        ),
                      ),
                      FilledButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                          enableFeedback: true,
                          visualDensity: .adaptivePlatformDensity,
                          padding: const EdgeInsets.all(20),
                          foregroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
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
                            const Text(
                              'Sign Up with Facebook',
                              style: TextStyle(fontFamily: 'GeneralSans'),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 16,

                              color: const Color(0x92000000),
                              fontFamily: 'GeneralSans',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontWeight: .w600,
                                fontSize: 16,
                                fontFamily: 'GeneralSans',
                                color: Color(0xFF000000),
                                decoration: .underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
