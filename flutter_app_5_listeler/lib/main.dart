import 'package:flutter/material.dart';
import 'package:flutter_app_5_listeler/ui_body/myBody_customScroll_slivers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        /*appBar: AppBar(
          title: Text("Listeler"),
          leading: Icon(Icons.android),
        ),*/
        body: MyBodyCustomscrollSliver(),
      ),
    );
  }
}
