import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketChatScreen extends StatefulWidget {
  const SocketChatScreen({super.key});

  @override
  _SocketChatScreenState createState() => _SocketChatScreenState();
}

class _SocketChatScreenState extends State<SocketChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.text.isNotEmpty) {
            _channel.sink.add(_controller.text);
          }
        },
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
