import 'package:flutter/material.dart';
import 'package:shopping_app/provider/order_provider.dart';

class OrderItemTile extends StatefulWidget {
  final OrderItemModel order;

  const OrderItemTile({super.key, required this.order});
  @override
  State<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('${widget.order.totalPrice} \$'),
            subtitle: Text('${widget.order.orderTime}'),
            trailing: IconButton(
              icon: isExpanded
                  ? const Icon(
                      Icons.expand_less,
                    )
                  : const Icon(
                      Icons.expand_more,
                    ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Container(
              height: widget.order.cardItems.length * 28,
              child: ListView(
                children: widget.order.cardItems
                    .map((product) => Row(
                          children: [
                            Expanded(child: Text("${product.title}")),
                            Text(" x${product.qty}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("${product.price}"),
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
