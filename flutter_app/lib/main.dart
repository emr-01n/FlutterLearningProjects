import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

main() => runApp(
      new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.cyan,
        ),
        home: new Scaffold(
          appBar: AppBar(
            title: Text(
              "Emre",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("tıklandı");
            },
            child: Icon(
              Icons.add,
              size: 36.0,
              color: Colors.white,
            ),
          ),
          body: Center(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 64,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 64,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 64,
                    color: Colors.red,
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 64,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
