import 'package:flutter/material.dart';

import 'my_body.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Resimler"),
        ),
        body: MyBody(),
      ),
    );
  }
}
