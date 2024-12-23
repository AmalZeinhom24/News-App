import 'package:flutter/material.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';

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
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              borderSide: BorderSide(color: Colors.transparent)),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.list, color: Colors.white, size: 35,),
          ),
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'News App',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        //Use FutureBuilder when get in future
        body: FutureBuilder(
          future: ApiManager.getSources(),
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
        ),
      ),
    ));
  }
}
