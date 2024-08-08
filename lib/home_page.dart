import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).message),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).button),
            ),
          ],
        ),
      ),
    );
  }
}
