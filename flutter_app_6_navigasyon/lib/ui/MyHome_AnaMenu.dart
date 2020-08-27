import 'package:flutter/material.dart';

import 'myHome_A.dart';
import 'myHome_B.dart';
import 'myHome_C.dart';
import 'myHome_D.dart';
import 'myHome_E.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Color> renk = [
    Colors.green,
    Colors.red,
    Colors.teal,
    Colors.orange,
    Colors.deepPurple,
    Colors.brown,
  ];
  Color gelenRenk = Colors.blue;
  bool tiklaylaDondu = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gelenRenk,
        title: Text("Navigasyon Ana Menü"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              elevation: 10,
              color: renk[0],
              child: Text(
                "A Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ASayfasi(renk: renk[0]),
                  ),
                );
              },
            ),
            RaisedButton(
              elevation: 10,
              color: renk[1],
              child: Text(
                "B Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BSayfasi(renk[1]),
                  ),
                );
              },
            ),
            RaisedButton(
              elevation: 10,
              color: renk[2],
              child: Text(
                "C Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CSayfasi(renk[2]),
                  ),
                ).then((gelenRenk) {
                  setState(() {
                    if (gelenRenk != null) this.gelenRenk = gelenRenk;
                  });
                });
              },
            ),
            RaisedButton(
              elevation: 10,
              color: renk[3],
              child: Text(
                "D Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DSayfasi(renk[3]),
                  ),
                ).then((tiklaylaDondu) {
                  setState(() {
                    this.tiklaylaDondu = tiklaylaDondu;
                  });
                });
              },
            ),
            RaisedButton(
              elevation: 10,
              color: renk[4],
              child: Text(
                "E Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ESayfasi(renk[4]),
                  ),
                );
              },
            ),
            RaisedButton(
              elevation: 10,
              color: renk[5],
              child: Text(
                "F Sayfasına Git",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/FPage",
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Icon(
                tiklaylaDondu ? Icons.accessibility_new : Icons.accessible,
                size: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
