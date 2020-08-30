import 'package:flutter/material.dart';
import 'package:fluuter_app_8_tasarim/navbarPage/tab_page.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabPage())),
          child: Text(
            "Settings",
            style: TextStyle(
                fontFamily: 'El Yazisi',
                fontSize: 40,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
