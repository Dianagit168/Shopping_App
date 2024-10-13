import 'package:flutter/material.dart';
import 'package:shopping_app/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _availProducts = [
    ProductModel(
        id: '1001',
        title: 'Samsung',
        description: "it's a phone",
        image: 'assets/images/boy.jpg',
        price: 1000),
    ProductModel(
        id: '1002',
        title: 'iphone',
        description: "it's a phone",
        image: 'assets/images/boy.jpg',
        price: 1000),
    ProductModel(
        id: '1003',
        title: 'realme',
        description: "it's a phone",
        image: 'assets/images/boy.jpg',
        price: 1000),
    ProductModel(
        id: '1004',
        title: 'nokia',
        description: "it's a phone",
        image: 'assets/images/boy.jpg',
        price: 1000),
    ProductModel(
        id: '1005',
        title: 'oneplus',
        description: "it's a phone",
        image: 'assets/images/boy.jpg',
        price: 1000),
  ];
  List<ProductModel> get availProducts => _availProducts;
  List<ProductModel> get favProducts {
    return _availProducts.where((product) => product.isFavorite).toList();
  }
  // void addProducts(value) {
  //   availProducts.addAll(value);
  //   notifyListeners();
  // }

  ProductModel findById(String id) {
    return _availProducts.firstWhere((product) => product.id == id);
  }
}
