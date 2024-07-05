class NewBookModel {
  final String id;
  final String title;
  final String imagelinks;
  final String description;

  const NewBookModel({
    required this.id,
    required this.title,
    required this.imagelinks,
    required this.description,
  });

  factory NewBookModel.fromJson(Map<String, dynamic> json) {
    return NewBookModel(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      imagelinks: json['volumeInfo']['imageLinks']['thumbnail'] ?? '',
      description: json['volumeInfo']['description'] ?? '',
    );
  }
}
