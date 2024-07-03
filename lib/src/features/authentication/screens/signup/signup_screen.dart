import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/authentication/screens/login/welcome_screen.dart';
import 'package:perpustakaan/src/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:perpustakaan/src/widgets/form/form_footer_widget.dart';
import 'package:perpustakaan/src/widgets/form/form_header_widget.dart';
import 'package:perpustakaan/src/widgets/form/header_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xff597445),
          Color(0xff658147),
          Color(0xff729762),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
              child: Column(
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: const Image(
                      image: AssetImage("assets/images/Logo.png"),
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FormHeaderWidget(
                    title: "Let's Register as an Anggota Perpus ",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(tPrimaryColor)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(tAccentColor)),
                              onPressed: null,
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                    color: tSecondaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: const HeaderWidget(title: "Sign Up"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1100),
                          child: const SignupFormWidget(),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1300),
                          child: const Text(
                            "or sigin with",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1350),
                          child: Container(
                            height: 35,
                            margin: const EdgeInsets.symmetric(horizontal: 100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red),
                            child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.google,
                                      size: 16, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Google",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FormFooterWidget(
                          question: "Already have an account?",
                          title: "Log In",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
