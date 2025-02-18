import 'package:flutter/material.dart';
import '../models/article.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  NewsItem({required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: article.urlToImage.isNotEmpty
            ? Image.network(article.urlToImage, width: 100, fit: BoxFit.cover)
            : Icon(Icons.article),
        title: Text(article.title),
        subtitle: Text(article.description),
        onTap: onTap,
      ),
    );
  }
}