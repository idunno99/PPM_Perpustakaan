import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget(
      {super.key,
      required this.question,
      required this.title,
      required this.onPressed});

  final String title, question;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1400),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            question,
            style: const TextStyle(color: Colors.grey),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(title,
                style: const TextStyle(
                  color: Color(0xffB59F6B),
                  fontWeight: FontWeight.bold,
                )),
          )
        ]),
      ),
    );
  }
}
