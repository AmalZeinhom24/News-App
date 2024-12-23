import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/screens/news_card.dart';
import 'package:news/screens/tab_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            //source indicates to e
            tabs: widget.sources
                .map((source) => Tab(
                      child: TabItem(
                          source,
                          /*to know which item is selected, use indexOf,
                          which needs source & return int,
                           that means return the source' index*/
                          widget.sources.indexOf(source) == selectedIndex
                              ? true
                              : false),
                    ))
                .toList(),
          ),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ''),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF02066F),
              ));
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? 'Something went wrong'),
                  TextButton(onPressed: () {}, child: const Text('Try again!'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? 'Something went wrong'),
                  TextButton(onPressed: () {}, child: const Text('Try again!'))
                ],
              );
            }

            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCard(news[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
