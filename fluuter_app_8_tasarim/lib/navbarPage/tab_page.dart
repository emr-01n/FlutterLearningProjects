import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  var tabContr;
  bool scroll = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabContr = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            setState(() {
              scroll ? scroll = false : scroll = true;
            });
          },
          child: Text("Tabbar Kullanımı"),
        ),
        
        bottom: TabBar(
          isScrollable: scroll,
          tabs: [
            Tab(
              icon: Icon(Icons.alarm),
              text: "Alarm",
            ),
            Tab(
              icon: Icon(Icons.phone),
              text: "Phone",
            ),
            Tab(
              icon: Icon(Icons.textsms),
              text: "Sms",
            ),
          ],
          controller: tabContr,
        ),
      ),
      body: TabBarView(
        controller: tabContr,
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                "Sayfa 1",
                style: TextStyle(fontSize: 36),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                "Sayfa 2",
                style: TextStyle(fontSize: 36),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "Sayfa 3",
                style: TextStyle(fontSize: 36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
