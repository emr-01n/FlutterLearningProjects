import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Örnek Uygulama",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: Colors.red.shade100,
                    child: Text(
                      "D",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade300,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade500,
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade700,
                    child: Text(
                      "K",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                ],
              ),
              Container(
                    color: Colors.red.shade200,
                    child: Text(
                      "E",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade300,
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade400,
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade500,
                    child: Text(
                      "L",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade600,
                    child: Text(
                      "E",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade700,
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
                  Container(
                    color: Colors.red.shade800,
                    child: Text(
                      "İ",
                      style: TextStyle(fontSize: 24),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(2),
                  ),
            ],
          ),
        ),
      ),
    );
