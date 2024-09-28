import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/order_provider.dart';
import 'package:shopping_app/widget/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const id = '/OrdersScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
          itemCount: orders.myOrders.length,
          itemBuilder: (context, index) => OrderItemTile(
                order: orders.myOrders[index],
              )),
    );
  }
}
