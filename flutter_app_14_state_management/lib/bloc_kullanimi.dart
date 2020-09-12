import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/BLOC/sayac/sayac_bloc.dart';
import 'package:flutter_app_14_state_management/BLOC/sayac/sayac_event.dart';

class BlocKullanimi extends StatefulWidget {
  @override
  _BlocKullanimiState createState() => _BlocKullanimiState();
}

class _BlocKullanimiState extends State<BlocKullanimi> {
  final _sayacBloc = SayacBLOC();

  @override
  void dispose() {
    // TODO: implement dispose
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
              stream: _sayacBloc.sayacStateStream,
              builder: (context, snapshot) => Text(
                snapshot.data.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "art",
            onPressed: () {
              _sayacBloc.sayacEventSink.add(SayacArttir());
            },
            tooltip: 'Increment',
            child: Icon(Icons.exposure_plus_1),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "azal",
            onPressed: () {
              _sayacBloc.sayacEventSink.add(SayacAzalt());
            },
            tooltip: 'Increment',
            child: Icon(Icons.exposure_neg_1),
          ),
        ],
      ),
    );
  }
}
