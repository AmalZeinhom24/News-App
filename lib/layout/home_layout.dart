import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:news/models/category_data.dart';
import 'package:news/screens/drawer_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/categories_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 20,
          backgroundColor: Color(0xFF02066F),
          elevation: 0,
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
              'News App',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        drawer: DrawerScreen(onDrawersSelected),
        body: categoryData == null
            ? CategoriesScreen(onCategoriesSelected)
            : HomeScreen(categoryData!),
      ),
    ));
  }

  CategoryData? categoryData = null;

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
}
