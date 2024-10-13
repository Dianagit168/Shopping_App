// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/config/app_rout.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/provider/card_provider.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardProvider>(context, listen: false);
    return Consumer<ProductModel>(
      builder: (BuildContext context, product, Widget? child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: GridTile(
            footer: GridTileBar(
              title: Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
              backgroundColor: Colors.black54,
              leading: IconButton(
                icon: product.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  product.toggleIsFav();
                  //print('product.isFavorite ${product.isFavorite}');
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  card.addItem(
                      productId: product.id,
                      productPrice: product.price,
                      productTitle: product.title);
                },
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.detail, arguments: product.id);
              },
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
