import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:perpustakaan/src/features/core/models/model_book.dart';

class ApiBokRepository {
  Future getBooks() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/volumes?q=flutter/&key=$_apiKey'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Book> book = it.map((e) => Book.fromJson(e)).toList();
        return book;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
