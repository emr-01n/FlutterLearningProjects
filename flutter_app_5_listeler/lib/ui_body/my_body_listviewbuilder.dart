import 'dart:math';

import 'package:flutter/material.dart';

class EtkinListeOrn extends StatelessWidget {
  List<Ogrenci> ogrencilist = [];

  @override
  Widget build(BuildContext context) {
    ogrenciListOlustur();

    return ListView.builder(
      itemCount: ogrencilist.length,
      itemBuilder: (context, index) => Card(
        elevation: 5,
        color: ogrencilist[index]._cins == true
            ? Colors.red.shade100
            : Colors.blue.shade100,
        child: ListTile(
          leading: Icon(ogrencilist[index]._cins == true
              ? Icons.beach_access
              : Icons.local_bar),
          title: Text(ogrencilist[index]._ad),
          subtitle: Text("Yaş: ${ogrencilist[index]._yas}"),
        ),
      ),
    );
  }

  void ogrenciListOlustur() {
    ogrencilist = List.generate(
      50,
      (index) => Ogrenci("Numara $index", Random().nextInt(index + 1),
          index % 2 == 0 ? true : false),
    );
  }
}

class Ogrenci {
  String _ad;
  int _yas;
  bool _cins;

  Ogrenci(this._ad, this._yas, this._cins);
}
