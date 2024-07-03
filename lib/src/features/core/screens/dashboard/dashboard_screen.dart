import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:perpus/menu_navigation.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/screens/home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
        bottomNavigationBar: Obx(
          () => NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 0,
            height: 80,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            indicatorColor: tAccentColor,
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            overlayColor: const WidgetStatePropertyAll(tAccentColor),
            backgroundColor: tPrimaryColor,
            animationDuration: const Duration(milliseconds: 300),
            destinations: const [
              NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  color: tSecondaryColor,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.clockRotateLeft,
                  color: tSecondaryColor,
                ),
                label: 'History',
              ),
              NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.solidBookmark,
                  color: tSecondaryColor,
                ),
                label: 'Bookmark',
              ),
              NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: tSecondaryColor,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    )
  ];
}
