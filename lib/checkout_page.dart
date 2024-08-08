import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final List<Map<String, String>> orderItems;

  const CheckoutPage({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    final double totalCost = orderItems.fold(
      0,
      (total, item) => total + double.parse(item['price']!),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) {
                  final item = orderItems[index];
                  return ListTile(
                    title: Text(item['name']!),
                    subtitle: Text('\$${item['price']}'),
                  );
                },
              ),
            ),
            Text(
              'Total: \$${totalCost.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
