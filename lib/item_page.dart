import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final Map<String, String> item;
  final Function(Map<String, String>) addItemToCart;

  ItemPage({required this.item, required this.addItemToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(item['image']!),
            const SizedBox(height: 16),
            Text(
              item['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(item['description']!),
            const SizedBox(height: 8),
            Text(
              '\$${item['price']}',
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addItemToCart(item);
                Navigator.pop(context);
              },
              child: const Text('Add to Order'),
            ),
          ],
        ),
      ),
    );
  }
}
