import 'package:flutter/cupertino.dart';

import '../model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(
        index: 0, categoryTitle: 'general', imageSource: 'general.jpg'),
    CategoryModel(
        index: 1, categoryTitle: 'business', imageSource: 'business.jpeg'),
    CategoryModel(
        index: 2, categoryTitle: 'health', imageSource: 'health.jpeg'),
    CategoryModel(
        index: 3, categoryTitle: 'science', imageSource: 'science.jpeg'),
    CategoryModel(index: 4, categoryTitle: 'sports', imageSource: 'sports.jpg'),
    CategoryModel(
        index: 5, categoryTitle: 'technology', imageSource: 'technology.jpg'),
    CategoryModel(
        index: 6,
        categoryTitle: 'entertainment',
        imageSource: 'entertainment.jpg'),
  ];
  int selectedIndex = 0;

  void changeCategory(CategoryModel category) {
    selectedIndex = category.index;
    notifyListeners();
  }
}
