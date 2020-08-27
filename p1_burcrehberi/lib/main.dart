import 'package:flutter/material.dart';
import 'package:p1_burcrehberi/ui/burc_list.dart';

void main() => runApp(MyApp());
  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BurcList(),
    );
  }
}
