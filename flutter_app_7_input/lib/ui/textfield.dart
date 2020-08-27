import 'package:flutter/material.dart';
import 'dart:math' as mat;

class MyBodyTextfield extends StatefulWidget {
  @override
  _MyBodyTextfieldState createState() => _MyBodyTextfieldState();
}

class _MyBodyTextfieldState extends State<MyBodyTextfield> {
  String metin;
  int lineSayisi = 1;
  Color cursorColor = Colors.black;
  TextEditingController controller1;
  FocusNode _fnode;

  @override
  void initState() {
    super.initState();
    metin = "Girdiğiniz metin burada gözükecek.";
    _fnode = FocusNode();
    controller1 = TextEditingController(text: "");

    _fnode.addListener(() =>
        setState(() => _fnode.hasFocus ? lineSayisi = 3 : lineSayisi = 1));
  }

  @override
  void dispose() {
    _fnode.dispose();
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          FocusScope.of(context).requestFocus(_fnode);
        },
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              focusNode: _fnode,
              cursorColor: cursorColor,
              controller: controller1,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              maxLines: lineSayisi,
              decoration: InputDecoration(
                hintText: "Bir metin giriniz...",
                labelText: "Metin Girme Alanı",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                icon: Icon(Icons.text_fields),
                prefixIcon: Icon(Icons.edit),
                suffixIcon: Icon(Icons.done),
                filled: true,
                fillColor: Colors.indigo.shade50,
              ),
              onChanged: (basilanChar) {
                setState(() {
                  cursorColor = Color.fromARGB(
                      mat.Random().nextInt(255),
                      mat.Random().nextInt(255),
                      mat.Random().nextInt(255),
                      mat.Random().nextInt(255));
                  metin = basilanChar;
                });
                debugPrint("on changed: " + basilanChar);
              },
              onSubmitted: (girilenMetin) {
                setState(
                  () {
                    metin = girilenMetin;
                  },
                );
                debugPrint("on sumbitted: " + girilenMetin);
              },
            ),
          ),
          Container(
            color: cursorColor,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: Align(
              alignment: Alignment.center,
              child: Text(metin),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
              color: cursorColor,
              onPressed: () {
                debugPrint(controller1.text.toString());
              },
              child: Text("Girilen değer debugPrint"),
            ),
          )
        ],
      ),
    );
  }
}
