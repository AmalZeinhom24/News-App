import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/screens/drawer_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/shared/styles/theming.dart';
import 'package:provider/provider.dart';
import '../models/NewsDataModel.dart';
import '../providers/settings_provider.dart';
import '../screens/categories_screen.dart';
import '../screens/widgets/news_card.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool search = false;
  bool isLoading = false;
  String searchError = '';
  NewsDataModel? searchResults;
  TextEditingController searchController = TextEditingController();

  Future<void> handleSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        searchResults = null;
      });
      return;
    }
    setState(() {
      isLoading = true;
      searchError = '';
    });
    try {
      final result = await ApiManager.searchArticles(query);
      setState(() {
        searchResults = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        searchError = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: provider.theme == ThemeMode.light
                ? AssetImage('assets/images/pattern.png')
                : AssetImage('assets/images/dark_pattern.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: !search
            ? AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          search = !search;
                        });
                      },
                      icon: Icon(Icons.search)),
                ],
                backgroundColor: Color(0xFF02066F),
                iconTheme: IconThemeData(color: Colors.white),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.transparent)),
                /*leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.list, color: Colors.white, size: 35,),
          ),*/
                title: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    AppLocalizations.of(context)!.appTitle,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : AppBar(
                toolbarHeight: 70,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.white),
                title: TextField(
                  controller: searchController,
                  onChanged: handleSearch,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    prefixIconColor: Color(0xFF02066F),
                    suffixIconColor: Color(0xFF02066F),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    hintText: AppLocalizations.of(context)!.searchArticels,
                    prefixIcon: IconButton(
                      onPressed: () {
                        search = false;
                        searchController.clear();
                        setState(() {});
                      },
                      icon: Icon(Icons.close),
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                backgroundColor: Color(0xFF02066F),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
        drawer: DrawerScreen(onDrawersSelected),
        body: search && searchController.text.isNotEmpty
            ? _buildSearchResults()
            : categoryData == null
                ? CategoriesScreen(onCategoriesSelected)
                : HomeScreen(categoryData!),
      ),
    ));
  }

  CategoryData? categoryData;

  void onDrawersSelected(number) {
    if (number == DrawerScreen.CATEGORIES) {
      categoryData = null;
    } else if (number == DrawerScreen.SETTINGS) {}
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategoriesSelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }

  Widget _buildSearchResults() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (searchError.isNotEmpty) {
      return Center(
        child: Text(
          searchError,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (searchResults == null || searchResults!.articles!.isEmpty) {
      return Center(
          child: Text(
        (AppLocalizations.of(context)!.noArticlesFound),
      ));
    }
    return ListView.builder(
      itemCount: searchResults!.articles!.length,
      itemBuilder: (context, index) {
        final article = searchResults!.articles![index];
        return NewsCard(
          article,
        );
      },
    );
  }
}
