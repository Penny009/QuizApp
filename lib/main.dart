import 'package:flutter/material.dart';
import 'package:quiz_app/src/screen/first.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(backgroundColor: Color(0xff2c2f38)),
      home: MainHome(),
    );
  }
}
