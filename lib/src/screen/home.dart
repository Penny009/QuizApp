import 'package:flutter/material.dart';
import 'package:quiz_app/src/commons/commons.dart';
import 'package:quiz_app/src/commons/title.dart';

import 'package:quiz_app/src/widget/booklets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c2f38),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff2c2f38),
        title: Text(
          'Kroks',
          style: TextStyle(),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Booklets',
                colors: white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Booklets(),
          ],
        ),
      ),
    );
  }
}
