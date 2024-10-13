import 'package:flutter/material.dart';
import 'package:shopping_app/provider/card_provider.dart';

class OrderItemModel {
  final String id;
  final double totalPrice;
  final DateTime orderTime;
  final List<CardModel> cardItems;
  OrderItemModel({
    required this.id,
    required this.totalPrice,
    required this.orderTime,
    required this.cardItems,
  });
}

class OrdersProvider with ChangeNotifier {
  final List<OrderItemModel> _myOrders = [];

  List<OrderItemModel> get myOrders => _myOrders;
  void addOrder({
    required List<CardModel> cardItems,
    required double totalPrice,
  }) {
    _myOrders.add(
      OrderItemModel(
          id: DateTime.now().toString(),
          totalPrice: totalPrice,
          orderTime: DateTime.now(),
          cardItems: cardItems),
    );
    notifyListeners();
  }
}
