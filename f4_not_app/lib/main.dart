import 'package:f4_not_app/model/kategori.dart';
import 'package:f4_not_app/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'model/notlar.dart';
import 'not_detay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Not Alma Uygulaması',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Center(child: Text("Notlar")),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "kategoriEkle",
            child: Icon(Icons.add_circle),
            mini: true,
            onPressed: () {
              kategoriEkleDiyalog(context);
            },
          ),
          FloatingActionButton(
            heroTag: "notEkle",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotDetay(
                        notBaslik: "Yeni Not",
                      )));
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: NotListesi(),
    );
  }

  kategoriEkleDiyalog(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    String yeniKategoriAdi;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
          contentPadding: EdgeInsets.all(10),
          title: Text(
            "Kategori Ekle",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                onSaved: (girilenDeger) {
                  yeniKategoriAdi = girilenDeger;
                },
                validator: (girilenDeger) {
                  if (girilenDeger.length < 3) {
                    return "En az 3 karakter giriniz";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kategori Adını Giriniz...",
                ),
              ),
            ),
            ButtonBar(
              buttonMinWidth: 80,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      databaseHelper
                          .kategoriEkle(Kategori(yeniKategoriAdi))
                          .then((kategoriID) {
                        Navigator.pop(context);
                      });
                    }
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
        );
      },
    );
  }
}

class NotListesi extends StatefulWidget {
  @override
  _NotListesiState createState() => _NotListesiState();
}

class _NotListesiState extends State<NotListesi> {
  List<Notlar> tumNotlar;
  DatabaseHelper databaseHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper = DatabaseHelper();
    tumNotlar = List<Notlar>();
    databaseHelper.notGetir().then((notListMap) {
      for (var notMap in notListMap) {
        tumNotlar.add(Notlar.fromMap(notMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tumNotlar.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(tumNotlar[index].notBaslik),
            ),
          );
        });
  }
}
