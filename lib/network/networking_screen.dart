import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NetworkingScreen extends StatefulWidget {
  const NetworkingScreen({super.key});

  @override
  _NetworkingScreenState createState() => _NetworkingScreenState();
}

class _NetworkingScreenState extends State<NetworkingScreen> {
  String data = '';
  final cacheManager = DefaultCacheManager();

  Future<void> fetchData() async {
    const url = 'https://jsonplaceholder.typicode.com/posts/1';
    var file = await cacheManager.getSingleFile(url);

    if (file != null) {
      final content = await file.readAsString();
      setState(() {
        data = json.decode(content)['title'];
      });
    } else {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        cacheManager.putFile(url, response.bodyBytes);
        setState(() {
          data = json.decode(response.body)['title'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Networking with Cache'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data),
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
