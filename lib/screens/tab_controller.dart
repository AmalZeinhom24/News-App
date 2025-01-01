import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/screens/details_screen.dart';
import 'package:news/screens/widgets/news_card.dart';
import 'package:news/screens/widgets/tab_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          //to know which item is selected, use indexOf,
                        //  which needs source & return int,
                         //  that means return the source' index

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
                  Text(snapshot.data?.message ??
                      AppLocalizations.of(context)!.error),
                  TextButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.tryAgain))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ??
                      AppLocalizations.of(context)!.error),
                  TextButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.tryAgain))
                ],
              );
            }

            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: news[index]);
                      },
                      child: NewsCard(news[index]));
                },
              ),
            );
          },
        )
      ],
    );
  }
}
