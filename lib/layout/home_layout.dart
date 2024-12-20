import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      //Use FutureBuilder when get in future
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          //In case the sources returned, receive them in list []
          var sources = snapshot.data?.sources ?? [];
          return ListView.builder(
            itemCount: sources.length,
            itemBuilder: (context, index) {
              return Text(sources[index].name ?? "");
            },
          );
        },
      ),
    ));
  }
}
