import 'package:flutter/material.dart';
import 'package:instagram/pages/create_post.dart';
import 'package:instagram/pages/home.dart';
import 'package:instagram/pages/notifications.dart';
import 'package:instagram/pages/profile.dart';
import 'package:instagram/pages/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instragram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: pages,
          ),
          bottomNavigationBar: new Container(
            margin: EdgeInsets.only(bottom: 20),
            child: new TabBar(
              tabs: <Widget>[
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.search),
                ),
                Tab(
                  icon: new Icon(Icons.add),
                ),
                Tab(
                  icon: new Icon(Icons.favorite),
                ),
                Tab(
                  icon: new Icon(Icons.perm_identity),
                ),
              ],
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
    );
  }

}