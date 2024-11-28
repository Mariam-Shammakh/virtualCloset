import 'package:flutter/material.dart';

class ImageItem {
  final String imagePath;
  String name;
  String category;

  ImageItem(
      {required this.imagePath, required this.name, required this.category});
}

class ImageModel with ChangeNotifier {
  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => _imageItems;

  void addImageItem(ImageItem imageItem) {
    _imageItems.add(imageItem);
    notifyListeners();
  }

  void deleteImageItem(int index) {
    _imageItems.removeAt(index);
    notifyListeners();
  }

  void editImageItem(int index, String newName, String newCategory) {
    _imageItems[index].name = newName;
    _imageItems[index].category = newCategory;
    notifyListeners();
  }
}
