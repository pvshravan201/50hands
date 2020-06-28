import 'dart:async';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class URLLauncher extends StatefulWidget {
  final String title;
  final String selectedUrl;

  URLLauncher({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  _URLLauncherState createState() => _URLLauncherState();
}

class _URLLauncherState extends State<URLLauncher> {
  bool isLoading;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
@override
  void initState() {
    super.initState();
    isLoading = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
                  children:<Widget>[ WebView(
            initialUrl: widget.selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: CircularProgressIndicator()) : Container(),
          ]
        ),
        // floatingActionButton: FutureBuilder<WebViewController>(
        // future: _controller.future,
        // builder: (BuildContext context, 
        //   AsyncSnapshot<WebViewController> controller) {
        //     if (controller.hasData) {
        //       return FloatingActionButton(
        //         child: Icon(Icons.arrow_back),
        //         onPressed: () {
        //           controller.data.goBack();
        //         });
        //     }

        //     return Container();
        //   }
        // ),
      );
  }
}