import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/config/app_rout.dart';
import 'package:shopping_app/provider/card_provider.dart';
import 'package:shopping_app/provider/order_provider.dart';
import 'package:shopping_app/provider/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.main,
      routes: AppRoutes.pages,
    );
  }
}
