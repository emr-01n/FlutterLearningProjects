import 'package:flutter/material.dart';

class MyBodyGridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      primary: false,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.teal.shade200,
          child: RaisedButton(
            onPressed: () {},
            child: Icon(
              Icons.person,
              size: 64,
            ),
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
        Container(
          color: Colors.teal.shade200,
          child: Icon(
            Icons.person,
            size: 64,
          ),
        ),
      ],
    );
  }
}
