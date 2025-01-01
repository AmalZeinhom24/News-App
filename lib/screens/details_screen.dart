import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/settings_provider.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details';

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    final article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: const Color(0xFF02066F),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            borderSide: BorderSide(color: Colors.transparent)),
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            AppLocalizations.of(context)!.discover,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF02066F))),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.urlToImage ?? '',
                  height: 230,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${article.source?.name}*',
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      article.title ?? '',
                      style: TextStyle(
                          fontSize: 16,
                          color: provider.theme == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(article.publishedAt?.substring(0, 10) ?? '',
                        textAlign: TextAlign.right),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            article.description ?? '',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 50),
                          InkWell(
                            onTap: () {
                              Uri url = Uri.parse(article.url ?? '');
                              launchUrl(url);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.fullArticle,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.arrow_right)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
