import 'package:flutter/material.dart';

class ImageItem {
  final String imagePath;
  final String name;
  final String category;

  ImageItem({required this.imagePath, required this.name, required this.category});
}

class ImageModel with ChangeNotifier {
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => _imageItems;

  void addImageItem(ImageItem imageItem) {
    _imageItems.add(imageItem);
    notifyListeners();
  }
}
