import 'package:flutter/material.dart';

class CardMoel {
  final String? id;
  final String? title;
  final String? price;
  final int? qty;

  CardMoel(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty});
}

class CardProvider extends ChangeNotifier {
  Map<String, CardMoel> _item = {};
  Map<String, CardMoel> get item => _item;
  void addItem({required String? productId, price, title}) {
    if (_item.containsKey(productId)) {
      _item.update(
          productId!,
          (value) => CardMoel(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty! + 1));
      notifyListeners();
    } else {
      _item.putIfAbsent(
        productId!,
        () => CardMoel(
          id: DateTime.now().toString(),
          title: title.toString(),
          price: price.toString(),
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
