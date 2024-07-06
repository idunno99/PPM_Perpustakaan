import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 150,
        child: MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, "/login");
          },
          height: 35,
          color: const Color(0xffB59F6B),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Text(
              "Log Out",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
