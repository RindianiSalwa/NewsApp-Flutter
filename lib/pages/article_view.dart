import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:newsapp/helpers/notif_helper.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  final String title;
  final String subtitle;

  const ArticleView({
    required this.blogUrl,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.blogUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showNewsNotification(widget.title, widget.subtitle);
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
