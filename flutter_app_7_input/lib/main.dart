import 'package:flutter/material.dart';
import 'package:flutter_app_7_input/ui/my_home_page.dart';

void main() => runApp(MyApp());
  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.deepOrange,
      ),
      title: 'Flutter Input Widgets',
      home: MyHomePage(),
    );
  }
}
  