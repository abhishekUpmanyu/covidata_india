import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatelessWidget {
  final String url;
  News(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.clear, color: Colors.black54), onPressed: () => Navigator.of(context).pop()),
        title: Text('COVID-19 News', style: TextStyle(color: Colors.black54)),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
