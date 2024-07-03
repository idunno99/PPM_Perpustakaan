class Book {
  final String id;
  final String title;
  final String imagelinks;

  const Book({
    required this.imagelinks,
    required this.id,
    required this.title,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      imagelinks: json['volumeInfo']['imageLinks']['thumbnail'] ?? '',
    );
  }
}
