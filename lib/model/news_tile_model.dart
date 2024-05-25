class NewsTileModel {
  final String title;
  final String description;
  final String image;
  final String content;

  NewsTileModel._(
      {required this.title,
      required this.description,
      required this.image,
      required this.content,
      });
  factory NewsTileModel.fromJson(Map<String, dynamic> article) {
    return NewsTileModel._(
      title: article['title'],
      description: article['description'],
      image: article['urlToImage'],
      content: article['content'] ?? '',

    );
  }
}
