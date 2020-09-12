import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/sayac.dart';
import 'package:provider/provider.dart';

class ProviderSayac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. kullanım: final Sayac mySayac = Provider.of<Sayac>(context);
    return Consumer(
      builder: (context, Sayac mySayac, child) => Scaffold(
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
                Text(
                  '${mySayac.sayac}',
                  style: Theme.of(context).textTheme.headline4,
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
                  mySayac.arttir();
                },
                tooltip: 'Increment',
                child: Icon(Icons.exposure_plus_1),
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "azal",
                onPressed: () {
                  mySayac.azalt();
                },
                tooltip: 'Increment',
                child: Icon(Icons.exposure_neg_1),
              ),
            ],
          )),
    );
  }
}
