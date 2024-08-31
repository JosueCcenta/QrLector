import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketService {
  late WebSocketChannel _channel;
  late Stream<String?> messageStream;

  WebSocketService(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    messageStream = _channel.stream.map((message) => message as String?);
  }

  void sendCode(String code) {
    final jsonMessage = jsonEncode({
      'operation': 'accessSheet',
      'sheetId': code,
    });
    _channel.sink.add(jsonMessage);
  }

  void dispose() {
    _channel.sink.close();
  }
}
