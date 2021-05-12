import 'package:ecommapp/flashScreen.dart';
import 'package:ecommapp/homeModel.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void main() {

 setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return flashScreen();
  }
}