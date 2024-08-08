import 'package:flutter/material.dart';

import '../network/dio_networking_screen.dart';
import '../network/networking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NetworkingScreen()),
                );
              },
              child: const Text('HTTP Networking'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DioNetworkingScreen()),
                );
              },
              child: const Text('Dio Networking'),
            ),
          ],
        ),
      ),
    );
  }
}
