import 'package:flutter/material.dart';
import 'package:flutter_app_6_navigasyon/ui/MyHome_AnaMenu.dart';
import 'package:flutter_app_6_navigasyon/ui/myHome_F.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/FPage" : (context) => FSayfasi() ,
      },
      home: AnaSayfa(),
    );
  }
}
