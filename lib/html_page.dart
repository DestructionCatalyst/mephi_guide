import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlPage extends StatefulWidget {

  final String htmlPageText;

  const HtmlPage({Key key, this.htmlPageText}) : super(key: key);

  @override
  _HtmlPageState createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {

  static const String htmlStart = """
    <html>
      <head></head>
      <body style="text-align:justify;color:black;background-color:rgba(250, 250, 250, 0);">
  """;

  static const String htmlEnd = """
      </body>
    </html>
  """;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Информация'),
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
      ),
      body: _buildWebView(widget.htmlPageText),
    );
  }

  WebView _buildWebView(String src) {
    return WebView(
      key: widget?.key,
      initialUrl: _updateUrl(src),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  String _updateUrl(String src) {
    return "data:text/html;charset=utf-8," +
        Uri.encodeComponent(wrapHtml(src));
  }

  static String wrapHtml(String src) {
    return '$htmlStart\n$src\n$htmlEnd';
  }
}
