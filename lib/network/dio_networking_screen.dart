import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioNetworkingScreen extends StatefulWidget {
  const DioNetworkingScreen({super.key});

  @override
  _DioNetworkingScreenState createState() => _DioNetworkingScreenState();
}

class _DioNetworkingScreenState extends State<DioNetworkingScreen> {
  String data = '';
  String error = '';

  Future<void> fetchData() async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts/2');
      setState(() {
        data = response.data['title'];
        error = '';
      });
    } catch (e) {
      setState(() {
        data = '';
        error = 'Failed to load data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Networking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (data.isNotEmpty) Text(data),
            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
