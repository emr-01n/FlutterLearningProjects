import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _aktifStep = 0;
  String isim, mail, sifre;
  List<Step> tumStepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Page"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },*/
          onStepContinue: () {
            _ileriButonFunc();
          },
          onStepCancel: () {
            if (_aktifStep > 0) {
              setState(() {
                _aktifStep--;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Kullanıcı Adı"),
        subtitle: Text("Username"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "En az 6 karakter giriniz";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Kullamıcı Adı giriniz...",
            border: OutlineInputBorder(),
          ),
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("E-Posta"),
        subtitle: Text("Email"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          validator: (girilenDeger) {
            if (!girilenDeger.contains("@")) {
              return "@ işareti içermeli";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "E-posta giriniz...",
            border: OutlineInputBorder(),
          ),
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Şifre"),
        subtitle: Text("Password"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "En az 6 karakter giriniz";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Şifre giriniz...",
            border: OutlineInputBorder(),
          ),
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int index) {
    if (_aktifStep == index) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButonFunc() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState.validate()) {
          key0.currentState.save();
          setState(() {
            hata = false;
            _aktifStep = 1;
          });
        } else {
          setState(() {
            hata = true;
          });
        }
        break;
      case 1:
        if (key1.currentState.validate()) {
          key1.currentState.save();

          setState(() {
            hata = false;
            _aktifStep = 2;
          });
        } else {
          setState(() {
            hata = true;
          });
        }
        break;
      case 2:
        if (key2.currentState.validate()) {
          key2.currentState.save();

          setState(() {
            hata = false;
            _aktifStep = 2;
          });
        } else {
          setState(() {
            hata = true;
          });
        }
        break;
    }
  }
}
