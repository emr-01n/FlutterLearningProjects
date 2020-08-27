import 'package:flutter/material.dart';

import 'myHome_A.dart';

class BSayfasi extends StatelessWidget {
  Color renk;
  BSayfasi(this.renk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("B Sayfası Appbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "B Sayfası",
              style: TextStyle(fontSize: 24),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Geri Dönmek İçin TIKLA",
                style: TextStyle(fontSize: 24),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ASayfasi(),
                ),
              ),
              child: Text(
                "A Sayfasına Gitmek İçin TIKLA",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
