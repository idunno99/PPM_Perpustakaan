class Book {
  final String id;
  final String title;
  final String imagelinks;
  final String description;

  const Book({
    required this.id,
    required this.title,
    required this.imagelinks,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      imagelinks: json['volumeInfo']['imageLinks']['thumbnail'] ?? '',
      description: json['volumeInfo']['description'] ?? '',
    );
  }
}
