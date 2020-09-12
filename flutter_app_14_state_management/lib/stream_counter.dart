import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounter extends StatefulWidget {
  @override
  _StreamCounterState createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sayac"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                initialData: 0,
                stream: _streamController.stream,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<int> snapshot,
                ) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headline1,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "art",
            onPressed: () {
              _streamController.sink.add(++_counter);
            },
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "azal",
            onPressed: () {
              _streamController.sink.add(--_counter);
            },
            tooltip: 'Increment',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }
}
