import 'package:flutter/material.dart';

class FSayfasi extends StatelessWidget {
  Color renk = Colors.green;
  FSayfasi({Color renk}) {
    if (renk != null) {
      this.renk = renk;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("F Sayfası Appbar"),
      ),
      body: Center(
        child: Text(
          "F Sayfası pushNamed",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
