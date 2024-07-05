class ModelComic {
  final String id;
  final String title;
  final String imagelinks;
  final String description;

  const ModelComic({
    required this.id,
    required this.title,
    required this.imagelinks,
    required this.description,
  });

  factory ModelComic.fromJson(Map<String, dynamic> json) {
    return ModelComic(
      id: json['id'] ?? '',
      title: json['volumeInfo']['title'] ?? '',
      imagelinks: json['volumeInfo']['imageLinks']['thumbnail'] ?? '',
      description: json['volumeInfo']['description'] ?? '',
    );
  }
}
