import 'package:f4_not_app/model/kategori.dart';
import 'package:f4_not_app/model/notlar.dart';
import 'package:f4_not_app/utils/database_helper.dart';
import 'package:flutter/material.dart';

class NotDetay extends StatefulWidget {
  String notBaslik = "Yeni Not";
  NotDetay({this.notBaslik});

  @override
  _NotDetayState createState() => _NotDetayState();
}

class _NotDetayState extends State<NotDetay> {
  var formKey = GlobalKey<FormState>();
  DatabaseHelper databaseHelper;
  List<Kategori> tumKategoriler;
  String notBaslik, notIcerik;
  int kategoriID = 1;
  List<String> oncelik = ["Düşük", "Orta", "Yüksek"];
  int secilenOncelik = 0;
  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    tumKategoriler = List<Kategori>();
    databaseHelper.kategorileriGetir().then((kategoriMapList) {
      for (var okunanKategoriMap in kategoriMapList) {
        tumKategoriler.add(Kategori.fromMap(okunanKategoriMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "notEkle",
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.notBaslik),
        ),
        body: tumKategoriler.length <= 0
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                            child: Text(
                              "Kategori:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<int>(
                                  iconSize: 36,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.local_offer),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.blue,
                                          )),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 10, 12, 10)),
                                  items: _dropItem(),
                                  onChanged: (kategoriID) {
                                    this.kategoriID = kategoriID;
                                  },
                                  value: kategoriID,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          onSaved: (newValue) {
                            notBaslik = newValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Not için başlık giriniz..."),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          onSaved: (newValue) {
                            notIcerik = newValue;
                          },
                          maxLines: 7,
                          decoration:
                              InputDecoration(hintText: "Notunuzu giriniz..."),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                            child: Text(
                              "Öncelik:",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<int>(
                                  iconSize: 36,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.label_outline),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.blue,
                                          )),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 10, 12, 10)),
                                  items: oncelik.map((e) {
                                    return DropdownMenuItem<int>(
                                      child: Text(e,
                                          style: TextStyle(fontSize: 20)),
                                      value: oncelik.indexOf(e),
                                    );
                                  }).toList(),
                                  onChanged: (oncelik) {
                                    secilenOncelik = oncelik;
                                  },
                                  value: secilenOncelik,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonBar(
                        mainAxisSize: MainAxisSize.max,
                        alignment: MainAxisAlignment.center,
                        buttonMinWidth: 80,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              formKey.currentState.save();
                              var suan = DateTime.now();
                              databaseHelper.notEkle(Notlar(
                                  kategoriID,
                                  notBaslik,
                                  notIcerik,
                                  suan.toString(),
                                  secilenOncelik));
                            },
                            child: Text("Kaydet"),
                            color: Colors.green,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Vazgeç"),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  List<DropdownMenuItem<int>> _dropItem() {
    List<DropdownMenuItem<int>> dizi = [];
    for (var i in tumKategoriler) {
      dizi.add(
        DropdownMenuItem<int>(
          value: i.kategoriID,
          child: Text(
            i.kategoriBaslik,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
    return dizi;
  }
}
