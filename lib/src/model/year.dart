import 'package:flutter/cupertino.dart';

class Year {
  String name;
  String image;

  Year({
    @required this.name,
    @required this.image,
  });
}

List<Year> yearsList = [
  Year(name: '2012', image: '1.png'),
  Year(name: '2013', image: '2.png'),
  Year(name: '2014', image: '4.png'),
  Year(name: '2015', image: '3.png'),
  Year(name: '2016', image: '5.png'),
  Year(name: '2017', image: '6.png'),
  Year(name: '2018', image: '7.png'),
  Year(name: '2019', image: '8.png'),
];
