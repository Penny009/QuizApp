import 'package:flutter/material.dart';
import 'package:quiz_app/src/commons/commons.dart';
import 'package:quiz_app/src/screen/sign_up.dart';
import 'package:quiz_app/src/widget/booklets.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  child: Text('Booklet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: white,
                      ))),
              Tab(
                child: Text(
                  'Base',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: white),
                ),
              ),
              Tab(
                child: Text(
                  'Quiz',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
            controller: tabController,
            children: <Widget>[Booklets(), SignUp(), SignUp()]));
  }
}
