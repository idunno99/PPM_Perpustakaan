import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/authentication/controllers/firebase_auth_services.dart';
// import 'package:perpustakaan/src/features/core/screens/dashboard/dashboard_screen.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
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
                hintText: "Email",
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
              controller: _passwordController,
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
                  onPressed: _singIn,
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

  void _singIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is Successfully created");
      Navigator.pushNamed(context, '/dashboard');
    } else {
      print("User is not Successfully created");
    }
  }
}
