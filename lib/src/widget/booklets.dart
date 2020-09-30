import 'package:flutter/material.dart';
import 'package:quiz_app/src/widget/quizpage.dart';

class Booklets extends StatefulWidget {
  @override
  _BookletsState createState() => _BookletsState();
}

class _BookletsState extends State<Booklets> {
  Widget _buildBooklets(String year, String image) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          // in changelog 1 we will pass the langname name to ther other widget class
          // this name will be used to open a particular JSON file
          // for a particular language
          builder: (context) => GetJson(year),
        ));
      },
      child: Container(
        height: 220,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  image,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Text(year)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _buildBooklets('2010', 'images/1.png'),
                      SizedBox(
                        height: 30,
                      ),
                      _buildBooklets('2012', 'images/1.png'),
                      SizedBox(
                        height: 30,
                      ),
                      _buildBooklets('2014', 'images/2.png'),
                      SizedBox(
                        height: 30,
                      ),
                      _buildBooklets('2016', 'images/3.png'),
                      SizedBox(
                        height: 30,
                      ),
                      _buildBooklets('2018', 'images/4.png'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      children: [
                        _buildBooklets('2011', 'images/5.png'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildBooklets('2013', 'images/6.png'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildBooklets('2015', 'images/7.png'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildBooklets('2017', 'images/8.png'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildBooklets('2019', 'images/1.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
