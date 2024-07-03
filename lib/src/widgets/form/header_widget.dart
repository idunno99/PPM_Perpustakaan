import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Color(0xff597445),
          fontFamily: 'Poppins',
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
  }
}
