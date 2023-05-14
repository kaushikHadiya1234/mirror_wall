import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebScreen1 extends StatefulWidget {
  const WebScreen1({Key? key}) : super(key: key);

  @override
  State<WebScreen1> createState() => _WebScreen1State();
}

class _WebScreen1State extends State<WebScreen1> {
  @override
  Widget build(BuildContext context) {
    String link = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse("$link")),
        ),
      ),
    );
  }
}
