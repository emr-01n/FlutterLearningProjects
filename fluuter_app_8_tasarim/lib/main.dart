import 'package:flutter/material.dart';
import 'package:fluuter_app_8_tasarim/navbarPage/search.dart';
import 'package:fluuter_app_8_tasarim/ui/drawer_menu.dart';
import 'package:fluuter_app_8_tasarim/ui/font_body.dart';
import 'package:fluuter_app_8_tasarim/ui/inner_drawer.dart';

import 'navbarPage/contact.dart';
import 'navbarPage/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tasarım',
      theme: ThemeData(
        //fontFamily: "El Yazisi",
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _aktifNavItem = 0;

  List<Widget> sayfalar;

  FontBody fontBody;
  Search search;
  Contact contact;
  Settings settings;

  var searchKey = PageStorageKey("searchkey");
  var fontKey = PageStorageKey("fontkey");
  var contactKey = PageStorageKey("contactkey");

  @override
  void initState() {
    super.initState();
    fontBody = FontBody(fontKey);
    search = Search(searchKey);
    contact = Contact(contactKey);
    settings = Settings();
    sayfalar = [fontBody, search, contact, settings];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      drawer: DrawerMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Flutter Tasarım",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: sayfalar[_aktifNavItem],
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.amber,
          ),
          title: Text("Home"),
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),
          title: Text("Contact"),
          backgroundColor: Colors.teal,
          activeIcon: Icon(Icons.phone_iphone),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
          backgroundColor: Colors.black,
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: _aktifNavItem,
      onTap: (index) {
        setState(() {
          _aktifNavItem = index;
        });
      },
    );
  }
}
