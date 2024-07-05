import 'package:flutter/material.dart';
import 'package:perpustakaan/src/constants/colors.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  scale: 0.1,
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
          ),
          Text(title,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: tPrimaryColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 15)),
        ],
      ),
    );
  }
}
