// import 'package:fashion/model/item.dart';
// import 'package:flutter/material.dart';

// class Cart with ChangeNotifier {
//   List selectedProducts = [];
//   int price = 0;

//   add(Item product) {
//     selectedProducts.add(product);
    
//     notifyListeners();
//   }

//   delete(Item product) {
//     selectedProducts.remove(product);
   

//     notifyListeners();
//   }

  // get itemCount {
  //   return selectedProducts.length;
  // }
// }
import 'package:flutter/material.dart';
import '../model/item.dart';

class Cart with ChangeNotifier {
  // List of favorited items
  List<Item> _selectedProducts = [];

  List<Item> get selectedProducts => _selectedProducts;

  void add(Item product) {
    if (!_selectedProducts.contains(product)) {
      _selectedProducts.add(product);
      notifyListeners(); // Notify listeners for UI updates
    }
  }

  void delete(Item product) {
    _selectedProducts.remove(product);
    notifyListeners();
  }

  // Check if an item is already favorited
  bool isFavorite(Item product) {
    return _selectedProducts.contains(product);
  }

  // Toggle favorite state
  void toggleFavorite(Item product) {
    if (isFavorite(product)) {
      delete(product);
    } else {
      add(product);
    }
  }
    get itemCount {
    return selectedProducts.length;
  }
}
