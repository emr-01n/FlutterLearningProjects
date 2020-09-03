import 'package:flutter/material.dart';
import 'package:flutter_app_10_json/local_json.dart';
import 'package:flutter_app_10_json/remote_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json ve Api kullanımı',
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
      appBar: AppBar(
        title: Text("Json ve Api Kullanımı"),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalJson()));
                },
                child: Text("Local Json"),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RemoteApi()));
                },
                child: Text("Remote Api"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
