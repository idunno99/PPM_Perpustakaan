import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/authentication/controllers/signup_controller.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.fullname,
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
              controller: controller.email,
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
              controller: controller.password,
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
                if (value != controller.password.text) {
                  return "Password doesn't match";
                }
                return null;
              },
              controller: controller.confrimpassword,
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
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    
                    if (formKey.currentState!.validate()) {
                      SignupController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                    }
                  },
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
}
