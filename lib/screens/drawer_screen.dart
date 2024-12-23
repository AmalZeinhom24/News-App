import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;
  DrawerScreen(this.onDrawerSelected, {super.key});
  static const int HOME = 2;
  static const int CATEGORIES = 2;
  static const int SETTINGS = 3;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          builderHeader(),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {
                onDrawerSelected(HOME);
              }),
          ListTile(
              leading: Icon(Icons.list),
              title: Text('Categories',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              onTap: () {
                onDrawerSelected(CATEGORIES);
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              onTap: () {
                onDrawerSelected(SETTINGS);
              }),
        ],
      ),
    );
  }

  builderHeader() {
    return UserAccountsDrawerHeader(
        accountName: Text('Amal Nasr'),
        accountEmail: Text('amalnasr2492@gmail.com'),
    currentAccountPicture: CircleAvatar(radius:40, foregroundImage: AssetImage('assets/images/user_profile.webp')),
    );
    /*DrawerHeader(
      padding: EdgeInsets.all(0),
      child: Container(
        color: Colors.indigoAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(radius:40, foregroundImage: AssetImage('assets/images/user_profile.webp')),
              SizedBox(height: 20),
              Text(
                'Hi, Amal',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
