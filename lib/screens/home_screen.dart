import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/screens/tab_controller.dart';

import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  CategoryData categoryData;
  HomeScreen(this.categoryData, {super.key});

  @override
  Widget build(BuildContext context) {
    //Use FutureBuilder when get in future
    return FutureBuilder(
      future: ApiManager.getSources(categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(
            color: Color(0xFF02066F),
          ));
        }
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        /*In case of the data returned correctly the statues will be 'ok'
            So any other response we will not need it*/
        if (snapshot.data?.status != 'ok') {
          return Center(child: Text(snapshot.data!.message!));
        }
        //In case the sources returned, return an empty list []
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
