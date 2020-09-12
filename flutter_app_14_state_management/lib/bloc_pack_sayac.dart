import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/BLOC%20Pack/sayac/sayac_bloc.dart';
import 'package:flutter_app_14_state_management/BLOC%20Pack/sayac/sayac_state.dart';
import 'package:flutter_app_14_state_management/BLOC/sayac/sayac_bloc.dart';
import 'package:flutter_app_14_state_management/BLOC/sayac/sayac_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPackSayac extends StatefulWidget {
  @override
  _BlocPackSayacState createState() => _BlocPackSayacState();
}

class _BlocPackSayacState extends State<BlocPackSayac> {
  final _mySayacBloc = SayacBloc(SayacState.initial());
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayacBloc>(
      create: (context) => _mySayacBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Sayac"),
        ),
        body: myCenter(),
        floatingActionButton: myFAB(),
      ),
    );
  }
}

class myCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SayacBloc>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
    );
  }
}

class myFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "art",
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.exposure_plus_1),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: "azal",
          onPressed: () {},
          tooltip: 'Discrement',
          child: Icon(Icons.exposure_neg_1),
        ),
      ],
    );
  }
}
