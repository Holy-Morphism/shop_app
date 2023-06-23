import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id, title, description, imageUrl;
  final double price;
  bool isFavourite;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavourite = false,
    required this.price,
  });

  void toggleFavorite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
