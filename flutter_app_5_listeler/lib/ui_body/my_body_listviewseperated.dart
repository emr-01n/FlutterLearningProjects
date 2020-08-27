import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class EtkinListeSeperated extends StatelessWidget {
  List<Ogrenci> ogrencilist = [];

  @override
  Widget build(BuildContext context) {
    ogrenciListOlustur();

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemCount: ogrencilist.length,
      itemBuilder: (context, index) => Card(
        elevation: 5,
        color: ogrencilist[index]._cins == true
            ? Colors.red.shade100
            : Colors.blue.shade100,
        child: ListTile(
          onLongPress: () {
            toastGoster(index, true);
            alertDialogGoster(context, ogrencilist[index]);
          },
          onTap: () {
            toastGoster(index, false);
          },
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

  void toastGoster(int index, bool isLong) {
    Fluttertoast.showToast(
        msg: ogrencilist[index].toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isLong ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void alertDialogGoster(BuildContext ctx, Ogrenci ogrenci) {
    showDialog(
        context: ctx,
        barrierDismissible: true,
        builder: (ctx) {
          return AlertDialog(
            title: Text(ogrenci._ad),
            backgroundColor:
                ogrenci._cins ? Colors.red.shade100 : Colors.blue.shade100,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Yaş: ${ogrenci._yas}"),
                Text("Cinsiyet: ${ogrenci._cins ? "kız" : "erkek"}"),
              ],
            ),
            actions: <Widget>[
              ButtonBarTheme(
                data: ButtonBarTheme.of(ctx),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text("Tamam"),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text("Kapat"),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class Ogrenci {
  String _ad;
  int _yas;
  bool _cins;

  Ogrenci(this._ad, this._yas, this._cins);
  @override
  String toString() {
    return "$_ad öğrencisi $_yas yaşında bir ${_cins ? "kız" : "erkek"} öğrencisidir";
  }
}
