import 'package:fashion/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];
  int price = 0;

  add(Item product) {
    selectedProducts.add(product);
    
    notifyListeners();
  }

  delete(Item product) {
    selectedProducts.remove(product);
   

    notifyListeners();
  }

  get itemCount {
    return selectedProducts.length;
  }
}