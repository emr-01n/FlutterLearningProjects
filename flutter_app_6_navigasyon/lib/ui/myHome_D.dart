import 'package:flutter/material.dart';

class DSayfasi extends StatelessWidget {
  Color renk;
  DSayfasi(this.renk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("D Sayfası Appbar"),
      ),
      body: WillPopScope(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "D Sayfası",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context, true),
                  child: Text(
                    "Geri Dönmek İçin TIKLA",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "(Eğer en yukarıdaki ok ile dönersen Ana Sayfadaki icon değişecek)",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
      ),
    );
  }
}
