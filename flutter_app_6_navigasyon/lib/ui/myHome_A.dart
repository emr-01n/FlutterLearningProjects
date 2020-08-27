import 'package:flutter/material.dart';

class ASayfasi extends StatelessWidget {
  Color renk = Colors.green;
  ASayfasi({Color renk}) {
    if (renk != null) {
      this.renk = renk;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("A Sayfası Appbar"),
      ),
      body: Center(
        child: Text(
          "A Sayfası",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
