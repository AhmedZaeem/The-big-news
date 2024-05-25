class NewsTileModel {
  final String title;
  final String description;
  final String image;
  final String content;
  final String sourceName;
  NewsTileModel._(
      {required this.title,
      required this.description,
      required this.image,
      required this.content,
      required this.sourceName,
      });
  factory NewsTileModel.fromJson(Map<String, dynamic> article) {
    return NewsTileModel._(
      title: article['title'],
      description: article['description'],
      image: article['urlToImage'],
      content: article['content'] ?? '',
      sourceName: article['source']['name'] ?? '',

    );
  }
}
