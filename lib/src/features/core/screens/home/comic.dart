import 'package:flutter/material.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/controllers/book_api.dart';
import 'package:perpustakaan/src/features/core/models/model_comic.dart';
import 'package:perpustakaan/src/features/core/screens/dashboard/widgets/card_book.dart';

class Comic extends StatefulWidget {
  const Comic({ super.key });

  @override
  State<Comic> createState() => _ComicState();
}

class _ComicState extends State<Comic> {
  BookApi getBook = BookApi();
  late Future<List<ModelComic>> listData;

  @override
  void initState() {
    super.initState();
    listData = getBook.getComic();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Comic",
                style: TextStyle(
                  color: tPrimaryColor,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: tPrimaryColor,
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: FutureBuilder<List<ModelComic>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ModelComic> books = snapshot.data!;
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return SizedBox(
                            child: Row(children: [
                          BookCard(
                            title: (books[index].title),
                            imageUrl: (books[index].imagelinks),
                          )
                        ]));
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
  }