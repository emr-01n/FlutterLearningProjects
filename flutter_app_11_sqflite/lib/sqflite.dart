import 'package:flutter/material.dart';
import 'package:flutter_app_11_sqflite/models/ogrenci.dart';
import 'package:flutter_app_11_sqflite/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class SQFlite extends StatefulWidget {
  @override
  _SQFliteState createState() => _SQFliteState();
}

class _SQFliteState extends State<SQFlite> {
  DatabaseHelper _databaseHelper;
  List<Ogrenci> tumOgrencilerListesi;
  var keyForm = GlobalKey<FormState>();
  bool aktiflik = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  int tiklanilanOgrenciIndex;

  var textFFcont = TextEditingController();

  @override
  void initState() {
    super.initState();
    tumOgrencilerListesi = List<Ogrenci>();
    dbdenOgrenciCek();
  }

  // Kendi yazdığım bir deneme
  // dbdenOgrenciCek() async {
  //   _databaseHelper = DatabaseHelper();
  //   var tumOgrencilerMapList = await _databaseHelper.tumOgrenciler();
  //   for (Map okunanOgrenciMapi in tumOgrencilerMapList) {
  //     tumOgrencilerListesi.add(Ogrenci.fromMap(okunanOgrenciMapi));
  //   }
  //   print(tumOgrencilerListesi.length);
  // }

  dbdenOgrenciCek() async {
    _databaseHelper = DatabaseHelper();
    _databaseHelper.tumOgrenciler().then((tumOgrencilerMap) {
      for (Map okunanOgrenciMapi in tumOgrencilerMap) {
        setState(() {
          tumOgrencilerListesi.add(Ogrenci.fromMap(okunanOgrenciMapi));
        });
      }
    }).catchError((hata) => print("hata : $hata"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("SQFlite"),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: keyForm,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: textFFcont,
                      validator: (kontrolEdilecekAd) {
                        if (kontrolEdilecekAd.length < 3) {
                          return "En az 3 karekter olmalı";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Öğrenci isminizi giriniz",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SwitchListTile(
                      title: Text("Aktif mi?"),
                      value: aktiflik,
                      onChanged: (deger) {
                        setState(() {
                          aktiflik = deger;
                        });
                      })
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text("Kaydet"),
                  color: Colors.green,
                  onPressed: () {
                    if (keyForm.currentState.validate()) {
                      _ogrenciEkle(Ogrenci(textFFcont.text, aktiflik ? 1 : 0));
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Güncelle"),
                  color: Colors.yellow,
                  onPressed: tiklanilanOgrenciIndex == null
                      ? null
                      : () {
                          if (keyForm.currentState.validate()) {
                            _ogrenciGuncelle(Ogrenci.wihtId(
                                textFFcont.text,
                                tumOgrencilerListesi[tiklanilanOgrenciIndex].id,
                                aktiflik ? 1 : 0));
                          }
                        },
                ),
                RaisedButton(
                  child: Text("Tümünü Sil"),
                  color: Colors.red,
                  onPressed: () {
                    _tumTabloyuSil();
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tumOgrencilerListesi.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          textFFcont.text = tumOgrencilerListesi[index].ad;
                          aktiflik = tumOgrencilerListesi[index].aktiflik == 1
                              ? true
                              : false;
                          tiklanilanOgrenciIndex = index;
                        });
                      },
                      child: Card(
                        color: tumOgrencilerListesi[index].aktiflik == 1
                            ? Colors.green.shade200
                            : Colors.red.shade200,
                        child: ListTile(
                          title: Text(tumOgrencilerListesi[index].ad),
                          trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _ogrenciSil(
                                    tumOgrencilerListesi[index].id, index);
                              }),
                          leading: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                                child: Text(
                              tumOgrencilerListesi[index].id.toString(),
                              style: TextStyle(fontSize: 18),
                            )),
                            decoration: BoxDecoration(
                              color: index == tiklanilanOgrenciIndex
                                  ? Colors.blue
                                  : Colors.amber,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _ogrenciEkle(Ogrenci ogrenci) async {
    var ogrenciId = await _databaseHelper.ogrenciEkle(ogrenci);
    ogrenci.id = ogrenciId;
    if (ogrenciId > 0) {
      setState(() {
        tumOgrencilerListesi.insert(0, ogrenci);
      });
    }
  }

  void _tumTabloyuSil() async {
    var silinenOgrenciSayisi = await _databaseHelper.tumTabloyuSil();
    if (silinenOgrenciSayisi > 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content:
              Text("Silinen eleman sayısı: ${silinenOgrenciSayisi.toString()}")));
      tiklanilanOgrenciIndex = null;
    }
    setState(() {
      tumOgrencilerListesi.clear();
    });
  }

  void _ogrenciSil(int dbdenSilmekIcinid, int listedenSilmekIcinIndex) async {
    var silinenOgrenciSayisi =
        await _databaseHelper.ogrenciSil(dbdenSilmekIcinid);

    if (silinenOgrenciSayisi == 1) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text("$dbdenSilmekIcinid id li öğrenci silindi")));
    }
    setState(() {
      tumOgrencilerListesi.removeAt(listedenSilmekIcinIndex);
    });
    tiklanilanOgrenciIndex = null;
  }

  void _ogrenciGuncelle(Ogrenci ogrenci) async {
    var guncellenenOgrenciSayisi =
        await _databaseHelper.ogrenciGuncelle(ogrenci);
    setState(() {
      tumOgrencilerListesi[tiklanilanOgrenciIndex] = ogrenci;
    });
    if (guncellenenOgrenciSayisi == 1) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text("${ogrenci.id} id li öğrenci güncellendi")));
    }
  }
}
