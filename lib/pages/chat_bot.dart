import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: WebView(
        initialUrl: 'https://webchat.snatchbot.me/2b3dc0cfffe3813aedb96a020ff9f5787da81e37d65cc8fe803715ac62b5428b',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}