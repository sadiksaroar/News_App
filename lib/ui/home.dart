import 'package:flutter/material.dart';
import 'package:news_code/ui/all_news.dart';
import 'package:news_code/ui/brecking_news.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Flutter News App'),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Bracking',
                ),
                Tab(
                  text: 'All News',
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [BreckingNews(), AllNewsDart()],
          ),
        ));
  }
}
