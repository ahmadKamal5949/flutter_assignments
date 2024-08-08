import 'package:flutter/material.dart';
import 'checkout_page.dart';
import 'menu_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<Map<String, String>> _orderItems = [];

  void _addItemToCart(Map<String, String> item) {
    setState(() {
      _orderItems.add(item);
    });
  }

  double _calculateTotalCost() {
    return _orderItems.fold(
      0,
      (total, item) => total + double.parse(item['price']!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(addItemToCart: _addItemToCart),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _orderItems.length,
              itemBuilder: (context, index) {
                final item = _orderItems[index];
                return ListTile(
                  title: Text(item['name']!),
                  subtitle: Text('\$${item['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${_calculateTotalCost().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(orderItems: _orderItems),
                ),
              );
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
