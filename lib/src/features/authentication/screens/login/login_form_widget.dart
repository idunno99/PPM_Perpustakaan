import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/screens/dashboard/dashboard_screen.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                focusColor: Color(0xff597445),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xff597445), width: 2.0),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: tPrimaryColor,
                  ),
                ),
                hintText: "Username or Email",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                focusColor: Color(0xff597445),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xff597445), width: 2.0),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: FaIcon(
                    FontAwesomeIcons.lock,
                    color: tPrimaryColor,
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Icon(Icons.visibility),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1250),
              child: SizedBox(
                width: 150,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  },
                  height: 40,
                  color: const Color(0xffB59F6B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
