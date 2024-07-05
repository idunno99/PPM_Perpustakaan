import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/screens/home/comic.dart';
import 'package:perpustakaan/src/features/core/screens/home/fiction_book.dart';
import 'package:perpustakaan/src/features/core/screens/home/new_book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // controller: controller.fullname,
              decoration: const InputDecoration(
                focusColor: Color(0xff597445),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: tPrimaryColor, width: 4.0),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: tPrimaryColor,
                  ),
                ),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: tPrimaryColor, width: 4, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const FictionBook(),
          const NewBook(),
          const Comic(),
        ]),
      ),
    );
  }
}
