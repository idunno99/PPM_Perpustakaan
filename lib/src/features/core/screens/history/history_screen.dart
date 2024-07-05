import 'package:flutter/material.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/screens/dashboard/widgets/card_hitory.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "BORROWING HISTORY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: tPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),
            ListView(
              primary: true,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: const [
                Column(
                  children: [
                    CardHistory(),
                    CardHistory(),
                    CardHistory(),
                    CardHistory(),
                    CardHistory(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
