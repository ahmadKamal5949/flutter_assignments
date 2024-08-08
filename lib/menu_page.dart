import 'package:flutter/material.dart';
import 'item_page.dart';

class MenuPage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {
      'name': 'Pizza',
      'description': 'Delicious cheese pizza',
      'price': '12.99',
      'image': 'assets/images/pizza.png'
    },
    {
      'name': 'Burger',
      'description': 'Juicy beef burger',
      'price': '10.99',
      'image': 'assets/images/burger.png'
    },
    // Add more items as needed
  ];
  final Function(Map<String, String>) addItemToCart;

  MenuPage({required this.addItemToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            child: ListTile(
              leading: Image.asset(item['image']!),
              title: Text(item['name']!),
              subtitle: Text('\$${item['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemPage(
                      item: item,
                      addItemToCart: addItemToCart,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
