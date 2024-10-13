import 'package:flutter/material.dart';

class CardModel {
  final String? id;
  final String? title;
  final String? price;
  final int? qty;

  CardModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty});
}

class CardProvider extends ChangeNotifier {
  Map<String, CardModel> _item = {}; //why use map?
  Map<String, CardModel> get item => _item;
  void addItem({required String? productId, productPrice, productTitle}) {
    if (_item.containsKey(productId)) //បានន័យAddថា item ហើយ
    {
      _item.update(
        // click item ដដែលៗ
        //do not know
        productId!,
        (value) => CardModel(
            id: value.id,
            title: value.title,
            price: value.price,
            qty: value.qty! + 1),
      );
      notifyListeners();
    } else {
      _item.putIfAbsent(
        productId!,
        () => CardModel(
          id: DateTime.now().toString(),
          title: productTitle.toString(),
          price: productPrice.toString(),
          qty: 1,
        ),
      );
      notifyListeners();
    }
  }

  double totalPrice() {
    double total = 0.0;
    _item.forEach(
        (key, value) => total += double.parse(value.price!) * value.qty!);
    return total;
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _item = {};
    notifyListeners();
  }
}
