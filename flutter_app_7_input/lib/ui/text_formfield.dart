import 'package:flutter/material.dart';

class MyPageTFField extends StatefulWidget {
  @override
  _MyPageTFFieldState createState() => _MyPageTFFieldState();
}

class _MyPageTFFieldState extends State<MyPageTFField> {
  String _adSoyad, _email, _pass;
  bool otoKontrol = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.teal,
        accentColor: Colors.amber,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TextFormField"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.save),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            autovalidate: otoKontrol,
            child: ListView(
              children: [
                TextFormField(
                  validator: (girilenVeri) => girilenVeri.length < 6
                      ? "Adınızı ve soyadınızı tam girin"
                      : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınızı ve Soyadınızı giriniz...",
                    labelText: "Ad Soyad",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onSaved: (girilenDeger) => _adSoyad = girilenDeger,
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (girilenVeri) =>
                      !girilenVeri.contains("@") ? "Geçersiz Email" : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email Adresini giriniz...",
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onSaved: (girilenDeger) => _email = girilenDeger,
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (girilenVeri) => girilenVeri.length < 6
                      ? "Şifre 6 karakterden kısa olmamalı"
                      : null,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: "Bir şifre giriniz...",
                    labelText: "Şifre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  onSaved: (girilenDeger) => _pass = girilenDeger,
                ),
                SizedBox(height: 10),
                RaisedButton.icon(
                  label: Text(
                    "Kaydet",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: _girisBilgileriniOnayla,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("adSoyad: $_adSoyad, email: $_email, şifre: $_pass");
    } else {
     setState(() {
        otoKontrol = true;
     });
    }
  }
}
