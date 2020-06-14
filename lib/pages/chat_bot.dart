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
        initialUrl: 'https://webchat.snatchbot.me/2cd686e10950d46c968744b9a93d61d6fcfdd38712cd8784a0e1b70c80b99587',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}