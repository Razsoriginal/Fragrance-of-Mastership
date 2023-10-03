import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuizForm extends StatefulWidget {
  final String url;
  final int tokenValue;
  final String entryValue;

  const QuizForm(
      {super.key,
      required this.url,
      required this.tokenValue,
      required this.entryValue});

  @override
  State<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            '${widget.url}?embedded=true&${widget.entryValue}=${widget.tokenValue}'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
