import 'package:assignment_two/home_page.dart';
import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'item_page.dart';
import 'order_page.dart';
import 'checkout_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      routes: {
        '/menu': (context) => MenuPage(addItemToCart: (item) {}),
        '/checkout': (context) => CheckoutPage(orderItems: []),
        '/item': (context) => ItemPage(
              addItemToCart: (item) {},
              item: {},
            ),
        '/order': (context) => OrderPage(),
      },
    );
  }
}
