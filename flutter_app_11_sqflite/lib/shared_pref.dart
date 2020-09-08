import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPref extends StatefulWidget {
  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  String isim;
  int yas;
  bool cinsiyet;

  var formKey;

  SharedPreferences mySharedPref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
    SharedPreferences.getInstance().then((sp) => mySharedPref = sp);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (deger) {
                    isim = deger;
                  },
                  decoration: InputDecoration(
                    labelText: "Adınızı giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (deger) {
                    yas = int.parse(deger);
                  },
                  decoration: InputDecoration(
                    labelText: "Yaşınızı giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: Text("Erkek"),
                        value: true,
                        groupValue: cinsiyet,
                        onChanged: (secildi) {
                          setState(() {
                            cinsiyet = secildi;
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: Text("Kadın"),
                        value: false,
                        groupValue: cinsiyet,
                        onChanged: (secildi) {
                          setState(() {
                            cinsiyet = secildi;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: _ekle,
                    child: Text("Kaydet"),
                    color: Colors.green,
                  ),
                  RaisedButton(
                    onPressed: _goster,
                    child: Text("Göster"),
                    color: Colors.yellow,
                  ),
                  RaisedButton(
                    onPressed: _sil,
                    child: Text("sil"),
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _ekle() async {
    formKey.currentState.save();
    await mySharedPref.setString("name", isim);
    await mySharedPref.setInt("yas", yas);
    await mySharedPref.setBool("cins", cinsiyet);
  }

  void _goster() {
    debugPrint(mySharedPref.getString("name") ?? "NO Name");
    debugPrint(mySharedPref.getInt("yas").toString() ?? "0");
    debugPrint(mySharedPref.getBool("cins").toString() ?? "NO Cinsiyet");
  }

  void _sil() {
    mySharedPref.remove("name");
    mySharedPref.remove("yas");
    mySharedPref.remove("cins");
  }
}
