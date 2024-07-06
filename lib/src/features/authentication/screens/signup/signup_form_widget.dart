import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/authentication/controllers/firebase_auth_services.dart';
// import 'package:get/get.dart';
// import 'package:perpustakaan/src/features/authentication/controllers/signup_controller.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  var formKey = GlobalKey<FormState>();
  var isLoading = false;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _fullnameController,
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
                hintText: "Full Name",
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
                    FontAwesomeIcons.solidEnvelope,
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
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Password doesn't match";
                }
                return null;
              },
              controller: _confirmPasswordController,
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
                hintText: "Confirm Password",
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
              height: 10,
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1250),
              child: SizedBox(
                width: 150,
                child: MaterialButton(
                  onPressed: _singUp,
                  height: 35,
                  color: const Color(0xffB59F6B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "SIGN UP",
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
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void _singUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (formKey.currentState?.validate() ?? false) {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null && password == confirmPassword) {
        Navigator.pushNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign Up Failed')),
        );
      }
    }
  }
}
