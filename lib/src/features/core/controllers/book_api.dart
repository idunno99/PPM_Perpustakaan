import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perpustakaan/src/features/core/models/model_book.dart';
import 'package:perpustakaan/src/features/core/models/model_comic.dart';
import 'package:perpustakaan/src/features/core/models/model_new_book.dart';

class BookApi {
  String uri = 'https://www.googleapis.com/books/v1/';
  String key = 'AIzaSyBgVXSfxTU0LZeUC13Qae779f108gMzefQ';

  Future<List<Book>> getBooks() async {
    final response = await http.get(
      Uri.parse(
          '${uri}volumes?q=subject:fiction&langRestrict=id&orderBy=newest&maxResults=10&startIndex=0&printType=books&key=$key'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> items = jsonResponse['items'];
      return items.map((item) => Book.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<NewBookModel>> getNewBooks() async {
    final response = await http.get(
      Uri.parse(
          '${uri}volumes?q=biography&langRestrict=id&orderBy=newest&maxResults=10&startIndex=0&printType=books&key=$key'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> items = jsonResponse['items'];
      return items.map((item) => NewBookModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<ModelComic>> getComic() async {
    final response = await http.get(
      Uri.parse(
          '${uri}volumes?q=komik&orderBy=newest&maxResults=10&startIndex=0&printType=books&key=$key'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> items = jsonResponse['items'];
      return items.map((item) => ModelComic.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
