import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as mat;

class MyBodyCustomscrollSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Sliver AppBar"),
          backgroundColor: Colors.indigo,
          flexibleSpace: FlexibleSpaceBar(
            background:
                Image.asset("assets/images/936378.jpg", fit: BoxFit.cover),
          ),
          centerTitle: true,
          expandedHeight: 200,
          floating: true,
          pinned: true,
          snap: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            listsContent(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _dinamikElemanUret,
            childCount: 6,
          ),
        ),
      SliverFixedExtentList(delegate: SliverChildListDelegate(listsContent()), itemExtent: 200),
      SliverFixedExtentList(delegate: SliverChildBuilderDelegate(_dinamikElemanUret, childCount: 6), itemExtent: 200,)
      ],
    );
  }

  List<Widget> listsContent() {
    return [
      Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 1",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
      Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 2",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
      Container(
        color: Colors.deepOrangeAccent,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 3",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
      Container(
        color: Colors.lime,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 4",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
      Container(
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 5",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
      Container(
        color: Colors.indigo,
        alignment: Alignment.center,
        child: Text(
          "Sabit Sliver List 6",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        height: 150,
      ),
    ];
  }

  Widget _dinamikElemanUret(BuildContext context, int index) {
    return Container(
      color: renkUret(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik Sliver List ${index +1}",
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
      height: 150,
    );
  }

  Color renkUret() {
    return Color.fromARGB(mat.Random().nextInt(255), mat.Random().nextInt(255),
        mat.Random().nextInt(255), mat.Random().nextInt(255));
  }
}
