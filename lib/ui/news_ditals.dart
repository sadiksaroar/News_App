import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_code/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDitals extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDitals({super.key, required this.newsModel});

  @override
  State<NewsDitals> createState() => _NewsDitalsState();
}

class _NewsDitalsState extends State<NewsDitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                  child: Text(widget.newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(widget.newsModel.publishedAt.toString()),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.author == null
                ? ""
                : "Written By: " + widget.newsModel.author.toString()),
            SizedBox(
              height: 3,
            ),
            Text(widget.newsModel.title.toString()),
            SizedBox(
              height: 8,
            ),
            Text(widget.newsModel.description.toString()),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.newsModel.url.toString());

                  if (!await launchUrl(uri)) {
                    throw Exception('Could not lunch');
                  }
                  ;
                },
                child: Text('Red More'))
          ],
        ),
      ),
    );
  }
}
