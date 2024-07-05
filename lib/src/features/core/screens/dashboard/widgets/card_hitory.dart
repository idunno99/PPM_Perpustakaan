import 'package:flutter/material.dart';
import 'package:perpustakaan/src/constants/colors.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: tPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Text(
              "230201",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/Cover.png"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "The Last Wish",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  width: 150,
                  child: Text("Returneed on :\n20 January 2023",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: tAccentColor,
                  ),
                  child: const Text(
                    "End",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
