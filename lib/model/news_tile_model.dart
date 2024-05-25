class NewsTileModel {
  final String title;
  final String description;
  final String image;
  final DateTime dateOfPublish;
  final String content;

  NewsTileModel._(
      {required this.title,
      required this.description,
      required this.image,
      required this.content,
      required this.dateOfPublish});
  factory NewsTileModel.fromJson(Map<String, dynamic> article) {
    return NewsTileModel._(
      title: article['title'],
      description: article['description'],
      image: article['urlToImage'],
      content: article['content'] ?? '',
      dateOfPublish: DateTime.parse(article['publishedAt']) ?? DateTime.now(),
    );
  }
}
