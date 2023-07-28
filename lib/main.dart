import 'package:flutter/material.dart';
import 'package:task_2/places.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home' : (context) => Myhome(),
      'places' : (context) => places(countryName: '',),
    },
  ));
}

