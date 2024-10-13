import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/config/app_rout.dart';

import 'package:shopping_app/provider/product_provider.dart';

import 'package:shopping_app/widget/grid_product_item.dart';

class MainProductScreen extends StatefulWidget {
  const MainProductScreen({super.key});

  @override
  State<MainProductScreen> createState() => _MainProductScreenState();
}

class _MainProductScreenState extends State<MainProductScreen> {
  bool showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Shop'), actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 0) {
              setState(() {
                showFav = true;
              });
            } else {
              setState(() {
                showFav = false;
              });
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text('Filter by favirite'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('Remove filter'),
              )
            ];
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.card);
            },
            icon: const Icon(Icons.shopping_cart_checkout)),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductGrid(
          isFav: showFav,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.order);
        },
        label: const Text('My Orders'),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final bool isFav;
  const ProductGrid({
    super.key,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    final availProducts = isFav ? products.favProducts : products.availProducts;
    return GridView.builder(
      itemCount: availProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
            value: availProducts[index],
            //create: (BuildContext context) => availProducts[index],
            child: const GridProductItem());
      },
    );
  }
}
