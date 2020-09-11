import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_13_animation/animasyon_app.dart';
import 'package:flutter_app_13_animation/animations_widget.dart';
import 'package:flutter_app_13_animation/staggered_animations.dart';
import 'package:flutter_app_13_animation/tween.dart';

import 'animation_control.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animasyon")),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimasyonKontrol()));
              },
              child: Text(
                "Animation Controller",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TweenKullanimi()));
              },
              child: Text(
                "Tween Kullanımı",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StaggeredAnimations()));
              },
              child: Text(
                "Staggered Animasyon",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.teal,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimationWidgets()));
              },
              child: Text(
                "Animation Widgets",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.teal,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimasyonApp()));
              },
              child: Text(
                "Uygulama",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
