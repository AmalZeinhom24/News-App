import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';

class NewsCard extends StatelessWidget {
  //An object from Articles type which be in postman & Includes the data of images
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF02066F))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              //this need the url of images to import
              imageUrl: articles.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF02066F),
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
              articles.author ?? '',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            Text(
              articles.title ?? '',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(articles.publishedAt?.substring(0, 10) ?? '',
                textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }
}
