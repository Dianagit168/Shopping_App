import 'package:shopping_app/screen/main_product_screen.dart';
import 'package:shopping_app/screen/my_card_screen.dart';
import 'package:shopping_app/screen/order_screen.dart';
import 'package:shopping_app/screen/product_detail_screen.dart';

class AppRoutes {
  static final pages = {
    // home: (context) => const HomePage(),
    main: (context) => const MainProductScreen(),
    detail: (context) => const ProductDetailScreen(),
    card: (context) => const MyCardScreen(),
    order: (context) => const OrdersScreen(),
    // //'/test': (context) => const TestPage(),
  };

  // static const login = '/';
  // static const home = '/home';
  static const main = '/main';
  static const detail = '/detail';
  static const card = '/card';
  // static const nearby = '/nearby';
  static const order = '/order';
}
