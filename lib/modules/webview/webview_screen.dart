import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  String Url ;
  WebViewScreen({required this.Url}) ;

var webcontroller = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: WebView(
        initialUrl: Url ,
      ),
    );
  }
}
