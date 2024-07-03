// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:perpus/src/constants/colors.dart';
// import 'package:perpus/src/features/core/screens/dashboard/dashboard_screen.dart';

// class MenuNavigation extends StatelessWidget {
//   const MenuNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());

//     return Obx(
//       () => NavigationBar(
//         elevation: 0,
//         height: 80,
//         selectedIndex: controller.selectedIndex.value,
//         onDestinationSelected: (index) =>
//             controller.selectedIndex.value = index,
//         indicatorColor: tAccentColor,
//         indicatorShape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         overlayColor: const WidgetStatePropertyAll(tAccentColor),
//         backgroundColor: tPrimaryColor,
//         animationDuration: const Duration(milliseconds: 300),
//         destinations: const [
//           NavigationDestination(
//             icon: FaIcon(
//               FontAwesomeIcons.house,
//               color: tSecondaryColor,
//             ),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
//             label: 'History',
//           ),
//           NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.solidBookmark),
//             label: 'Bookmark',
//           ),
//           NavigationDestination(
//             icon: FaIcon(FontAwesomeIcons.solidUser),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     const DashboardScreen(),
//     Container(
//       color: Colors.amber,
//     ),
//     Container(
//       color: Colors.blue,
//     ),
//     Container(
//       color: Colors.red,
//     )
//   ];
// }
