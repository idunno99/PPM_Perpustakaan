import 'package:flutter/material.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/controllers/book_api.dart';
import 'package:perpustakaan/src/features/core/models/model_book.dart';
import 'package:perpustakaan/src/features/core/screens/dashboard/widgets/card_book.dart';

class FictionBook extends StatefulWidget {
  const FictionBook({super.key});

  @override
  State<FictionBook> createState() => _FictionBookState();
}

class _FictionBookState extends State<FictionBook> {
  BookApi getBook = BookApi();
  late Future<List<Book>> listData;

  @override
  void initState() {
    super.initState();
    listData = getBook.getBooks();
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
                "Fiction Book",
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
            child: FutureBuilder<List<Book>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Book> books = snapshot.data!;
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
