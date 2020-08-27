import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomeInputWidgets extends StatefulWidget {
  @override
  _MyHomeInputWidgetsState createState() => _MyHomeInputWidgetsState();
}

class _MyHomeInputWidgetsState extends State<MyHomeInputWidgets> {
  bool checkBoxState = false;
  bool switchState = false;
  double sliderDeger = 0;
  Color sliderRenk = Colors.red;
  String secilenRenk = "kirmizi";
  List<String> sehirler = ["manisa", "izmir", "istanbul", "antep"];
  String secilenSehir = "manisa";

  String grupDeger = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diğer Form Elemanları"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (chckbxDurum) {
                setState(() {
                  checkBoxState = chckbxDurum;
                });
              },
              activeColor: Colors.green,
              title: Text("Checkbox title"),
              subtitle: Text("Checkbox subtitle"),
              checkColor: Colors.white,
              secondary: Icon(Icons.access_alarm),
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: grupDeger,
              onChanged: (secilenDeger) {
                setState(() {
                  grupDeger = secilenDeger;
                  debugPrint("$secilenDeger");
                });
              },
              title: Text("Ankara"),
              subtitle: Text("Radio subtitle"),
              secondary: Icon(Icons.accessible),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: grupDeger,
              onChanged: (secilenDeger) {
                setState(() {
                  grupDeger = secilenDeger;
                  debugPrint("$secilenDeger");
                });
              },
              title: Text("Bursa"),
              subtitle: Text("Radio subtitle"),
              secondary: Icon(Icons.accessible),
            ),
            RadioListTile<String>(
              value: "Manisa",
              groupValue: grupDeger,
              onChanged: (secilenDeger) {
                setState(() {
                  grupDeger = secilenDeger;
                  debugPrint("$secilenDeger");
                });
              },
              title: Text("Manisa"),
              subtitle: Text("Radio subtitle"),
              secondary: Icon(Icons.accessible),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (durum) {
                setState(() {
                  switchState = durum;
                });
              },
              title: Text("Dark mode"),
              secondary: Icon(Icons.phone_android),
              subtitle: Text("Dark Mode Açılır"),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.red.shade200,
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
              value: sliderDeger,
              onChanged: (yeniDeger) {
                setState(() {
                  sliderDeger <= 50
                      ? sliderRenk = Colors.red
                      : sliderRenk = Colors.green;
                  sliderDeger = yeniDeger;
                });
              },
              label: sliderDeger.toInt().toString(),
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: sliderRenk,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "yesil",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Mavi"),
                    ],
                  ),
                  value: "mavi",
                ),
              ],
              onChanged: (secilen) {
                setState(() {
                  secilenRenk = secilen;
                });
              },
              hint: Text("Seçiniz"),
              value: secilenRenk,
              dropdownColor: focusColor(secilenRenk),
            ),
            DropdownButton(
              items: sehirler
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (secilen) {
                setState(() {
                  secilenSehir = secilen;
                });
              },
              value: secilenSehir,
            ),
          ],
        ),
      ),
    );
  }

  Color focusColor(String renk) {
    if (renk == "kirmizi")
      return Colors.red;
    else if (renk == "yesil")
      return Colors.green;
    else if (renk == "mavi")
      return Colors.blue;
    else
      return Colors.white;
  }
}
