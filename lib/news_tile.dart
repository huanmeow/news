import 'package:flutter/material.dart';

import 'news_model.dart';


class NewsTile extends StatelessWidget {
  final Article article;

  NewsTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: article.urlToImage.isNotEmpty
            ? Image.network(article.urlToImage, width: 100, fit: BoxFit.cover)
            : Icon(Icons.image, size: 50),
        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text(article.description, maxLines: 3, overflow: TextOverflow.ellipsis),
        onTap: () {
          // Điều hướng đến trang chi tiết tin tức
        },
      ),
    );
  }
}
