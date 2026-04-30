import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Map article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Details")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article["urlToImage"] ?? ""),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                article["title"] ?? "",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(article["description"] ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}