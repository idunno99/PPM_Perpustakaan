import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:perpus/menu_navigation.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/screens/history/history_screen.dart';
import 'package:perpustakaan/src/features/core/screens/home/home_screen.dart';
import 'package:perpustakaan/src/features/core/screens/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  List<Widget> body = [
    const HomeScreen(),
    const HistoryScreen(),
    Container(
      color: Colors.blue,
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: tPrimaryColor,
          toolbarHeight: 65,
          title: const Image(image: AssetImage("assets/images/Logo.png")),
          actions: [
            Row(
              children: [
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.solidBell,
                            color: tSecondaryColor, size: 25))),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          elevation: 0,
          showUnselectedLabels: false,
          unselectedItemColor: tAccentColor,
          backgroundColor: tPrimaryColor,
          fixedColor: tSecondaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidBookmark),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUser),
              label: 'Profile',
            ),
          ],
        ),
        body: body[_currentIndex]);
  }
}
