import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';

class ShareInsights {
  final String title;
  final String description;
  final String content;

  ShareInsights({
    required this.title,
    required this.description,
    required this.content,
  });

  String? removeHtmlTags(String htmlString) {
    String? text = Html(data: htmlString).data;
    text = text?.replaceAll(RegExp(r'<img[^>]*?>'), '');
    text = text?.replaceAll(RegExp(r'<[^>]*>'), '');
    text = "$text\n\nShared via Fragrance of Mastership";
    return text;
  }

  void share(BuildContext context) {
    final cleanedContent = removeHtmlTags(content);

    final textToShare = '$title\n\n$description\n\n$cleanedContent';

    try {
      Share.share(textToShare);
    } catch (e) {
      print("Error While Sharing Article: $e");
    }
  }
}
