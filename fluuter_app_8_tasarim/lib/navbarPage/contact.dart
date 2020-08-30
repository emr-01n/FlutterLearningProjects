import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  Contact(Key k) : super(key: k);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var myContr =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool yatayEksen = true;
  bool isSnap = true;
  int sayfaNo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
            reverse: false,
            controller: myContr,
            pageSnapping: isSnap,
            onPageChanged: (value) {
              debugPrint("$value");
              sayfaNo = value;
            },
            children: [
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                height: 300,
                child: Center(
                  child: Text(
                    "Sayfa 0",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                height: 300,
                child: Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                height: 300,
                child: Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (sayfaNo > 0) {
                            myContr.jumpToPage(sayfaNo - 1);
                          }
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (sayfaNo < 2) {
                            myContr.jumpToPage(sayfaNo + 1);
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Yatay Eksen"),
                      Checkbox(
                          value: yatayEksen,
                          onChanged: (b) {
                            setState(() {
                              yatayEksen = b;
                            });
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Snipping"),
                      Checkbox(
                          value: isSnap,
                          onChanged: (b) {
                            setState(() {
                              isSnap = b;
                            });
                          })
                    ],
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      myContr.jumpToPage(2);
                    },
                    child: Text(
                      "2.sayfaya git",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
