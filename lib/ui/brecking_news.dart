import 'package:flutter/material.dart';
import 'package:news_code/components/news_item.dart';
import 'package:news_code/model/news_model.dart';
import 'package:news_code/service/api_service.dart';

class BreckingNews extends StatefulWidget {
  const BreckingNews({super.key});

  @override
  State<BreckingNews> createState() => _BreckingNewsState();
}

class _BreckingNewsState extends State<BreckingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBrekingNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ?? [];

            return ListView.builder(
              itemBuilder: (context, index) {
                //item
                return NewsItemList(
                  newsModel: articleList[index],
                );
              },
              itemCount: articleList.length,
            );
          }
          return const Center(
            child: CircleAvatar(),
          );
        },
      ),
    );
  }
}
