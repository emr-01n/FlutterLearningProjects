import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp build tetiklendi");
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "My App",
      home: MyHomePage(
        title: "My Home Page",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  int sayac = 0;
  MyHomePage({this.title}) {
    debugPrint("MyHomePage stateful constructor tetiklendi");
  }

  @override
  State<StatefulWidget> createState() {
    debugPrint("createState method tetiklendi");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    debugPrint("MyHomePageState constructor tetiklendi");
  }

  Widget build(BuildContext context) {
    debugPrint("MyHomePageState build tetiklendi");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _sayacArt();
            debugPrint("setState tetiklendi");
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("arttır"),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _sayacArt();
                  });
                }),
            Text(
              "${widget.sayac}",
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: widget.sayac < 0 ? Colors.red : Colors.green,
                  ),
            ),
            RaisedButton(
                child: Text("azalt"),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _sayacAzal();
                  });
                }),
          ],
        ),
      ),
    );
  }

  void _sayacArt() {
    widget.sayac++;
    debugPrint("${widget.sayac}");
  }

  _sayacAzal() {
    widget.sayac--;
    debugPrint("${widget.sayac}");
  }
}
