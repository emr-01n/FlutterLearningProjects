import 'package:flutter/material.dart';
import 'package:flutter_app_7_input/ui/some_input_widgets.dart';
import 'package:flutter_app_7_input/ui/stepper_page.dart';
import 'package:flutter_app_7_input/ui/text_formfield.dart';
import 'dart:math' as mat;

import 'package:flutter_app_7_input/ui/textfield.dart';

class MyHomePage extends StatelessWidget {
  DateTime suan = DateTime.now();
  TimeOfDay suankiSaat = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input işlemleri"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.blueGrey,
                child: Text("Textfield"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyBodyTextfield())),
              ),
              RaisedButton(
                color: Colors.teal,
                child: Text("TextFormField"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyPageTFField())),
              ),
              RaisedButton(
                color: Colors.lime,
                child: Text("Diğer Form Elemanları"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomeInputWidgets())),
              ),
              RaisedButton(
                color: Colors.indigo,
                child: Text("Stepper"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StepperPage())),
              ),
              RaisedButton(
                color: Colors.green,
                child: Text("Tarih Seç"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: suan,
                    firstDate: DateTime(suan.year, suan.month - 1),
                    lastDate: DateTime(suan.year, suan.month + 2),
                  ).then((secilenTarih) {
                    debugPrint(secilenTarih.toUtc().toString());
                    debugPrint(secilenTarih.toString());
                    debugPrint(secilenTarih.toIso8601String());
                    debugPrint(secilenTarih.millisecondsSinceEpoch.toString());
                    debugPrint(secilenTarih.add(Duration(days: 5)).toString());
                  });
                },
              ),
              RaisedButton(
                color: Colors.deepPurple,
                child: Text("Saat seç"),
                onPressed: () {
                  showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.dial,
                          initialTime: suankiSaat)
                      .then(
                    (girilenSaat) => debugPrint(
                      suankiSaat.toString(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
