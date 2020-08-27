import 'package:flutter/material.dart';
import 'dart:math' as mat;



class CSayfasi extends StatelessWidget {
  Color renk;
  CSayfasi(this.renk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("C Sayfası Appbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "C Sayfası",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Sadece Geri Dönmek İçin TIKLA",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(
                  context,
                  Color.fromARGB(
                    mat.Random().nextInt(255),
                    mat.Random().nextInt(255),
                    mat.Random().nextInt(255),
                    mat.Random().nextInt(255),
                  ),
                ),
                child: Text(
                  "Geri Dönmek ve Ana Sayfa Rengini Değiştirmek TIKLA",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
