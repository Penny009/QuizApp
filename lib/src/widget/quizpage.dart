import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GetJson extends StatelessWidget {
  String year;
  GetJson(this.year);
  String assettoload;

  setasset() {
    if (year == '2010') {
      assettoload = "asset/Q2010.json";
    } else if (year == '2011') {
      assettoload = "asset/Q2011.json";
    } else if (year == "2012") {
      assettoload = "assets/Q2012.json";
    } else if (year == "2013") {
      assettoload = "assets/Q2013.json";
    } else if (year == '2014') {
      assettoload = "asset/Q2014.json";
    } else if (year == '2015') {
      assettoload = "asset/Q2015.json";
    } else if (year == '2016') {
      assettoload = "asset/Q2016.json";
    } else if (year == '2017') {
      assettoload = "asset/Q2017.json";
    } else if (year == '2018') {
      assettoload = "asset/Q2018.json";
    } else {
      assettoload = "asset/Q2019.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = jsonDecode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold();
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final List mydata;
  QuizPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  final List mydata;

  _QuizPageState(this.mydata);

  int i = 1;
  int j = 1;
  var marks = 0;
  int x = 0.5.toInt();

  int timer = 30;
  String showtimer = '30';

  bool disableAnswer = false;
  bool canceltimer = false;
  var randomArray;

  Color toShow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btnColor = {
    'a': Color(0xff7880a7),
    'b': Color(0xff7880a7),
    'c': Color(0xff7880a7),
    'd': Color(0xff7880a7),
    'e': Color(0xff7880a7),
  };

//  Generate random questions
  gennrandomarray() {
    var distintIds = [];
    var rand = new Random();
    for (i = 0;;) {
      distintIds.add(rand.nextInt(10));
      randomArray = distintIds.toSet().toList();
      if (randomArray.length < 10) {
        continue;
      } else {
        break;
      }
    }
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + x;
      toShow = right;
    } else {
      toShow = wrong;
    }
    setState(() {
      btnColor[k] = toShow;
      disableAnswer = true;
      canceltimer = true;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = randomArray[j];
        j++;
      } else {}
      btnColor['a'] = Color(0xff7880a7);
      btnColor['b'] = Color(0xff7880a7);
      btnColor['c'] = Color(0xff7880a7);
      btnColor['d'] = Color(0xff7880a7);
      btnColor['e'] = Color(0xff7880a7);
      disableAnswer = false;
    });
    starttimer();
  }

//   Create widget for the answers
  Widget answerbutton(String k) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: btnColor[k],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          child: MaterialButton(
            onPressed: () => checkanswer(k),
            child: Text(
              mydata[1][i.toString()][k],
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text('Are you sure you want to leave?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booklets'),
          centerTitle: true,
          backgroundColor: Color(0xff202849),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xff202849),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Question 1',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Color(0xFFFF3500)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 250,
                  child: Center(
                    child: Text(
                      mydata[0][i.toString()],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          answerbutton('a'),
                          SizedBox(height: 20.0),
                          answerbutton('b'),
                          SizedBox(height: 20.0),
                          answerbutton('c'),
                          SizedBox(height: 20.0),
                          answerbutton('d'),
                          SizedBox(height: 20.0),
                          answerbutton('e'),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x80000000),
                                        blurRadius: 30.0,
                                        offset: Offset(0.0, 5.0)),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF0000FF),
                                      Color(0xFFFF3500),
                                    ],
                                  ),
                                ),
                                height: 70,
                                width: 200.0,
                                child: MaterialButton(
                                  onPressed: null,
                                  child: Center(
                                    child: Text('Next',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
