import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/user_repo.dart';
import 'package:provider/provider.dart';

class LoginEkrani extends StatefulWidget {
  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailCntr;
  TextEditingController _sifreCntr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailCntr = TextEditingController(text: "");
    _sifreCntr = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserReposity>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Ekran"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailCntr,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen email alanını doldur";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _sifreCntr,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen şifre alanını doldur";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "sifre", border: OutlineInputBorder()),
                ),
              ),
              userRepo.durum == UserDurumu.OturumAciliyor
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          var sonuc = await userRepo.signIn(
                              _emailCntr.text, _sifreCntr.text);

                          if (_formKey.currentState.validate()) {
                            if (!sonuc) {
                              print("girdi");
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Email/şifre yanlış"),
                                duration: Duration(seconds: 1),
                              ));
                            }
                          }
                        },
                        child: Text("Giriş Yap"),
                        color: Colors.green,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () async {
                    userRepo.googsignIn();
                  },
                  child: Text("Google ile giriş Yap"),
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
