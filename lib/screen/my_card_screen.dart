import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/card_provider.dart';
import 'package:shopping_app/provider/order_provider.dart';
import 'package:shopping_app/widget/cart_item.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total'),
                  const Spacer(),
                  Chip(label: Text('${card.totalPrice()} \$')),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addOrder(
                        cardItems: card.item.values.toList(),
                        totalPrice: card.totalPrice(),
                      );
                      card.clearCart();
                    },
                    child: const Text('Order Now'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: card.item.length,
                itemBuilder: (context, index) => CartItemTile(
                      id: card.item.values.toList()[index].id!,
                      title: card.item.values.toList()[index].title!,
                      price: card.item.values.toList()[index].price!,
                      qty: card.item.values.toList()[index].qty!,
                      productId: card.item.keys.toList()[index],
                    )),
          ),
        ],
      ),
    );
  }
}
