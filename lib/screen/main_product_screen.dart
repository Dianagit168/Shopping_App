import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/config/app_rout.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/provider/product_provider.dart';

import 'package:shopping_app/widget/grid_product_item.dart';

class MainProductScreen extends StatelessWidget {
  const MainProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.order);
        },
        label: const Text('My Orders'),
      ),
      appBar: AppBar(title: const Text('Phone Shop'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.card);
            },
            icon: const Icon(Icons.shopping_cart_checkout)),
      ]),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductGrid(),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final availProducts = Provider.of<ProductProvider>(context).availProducts;
    return GridView.builder(
      itemCount: availProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<ProductModel>(
            create: (BuildContext context) => availProducts[index],
            child: const GridProductItem());
      },
    );
  }
}
