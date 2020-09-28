import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  String secilenSehir;
  LocationWidget({@required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(
        secilenSehir,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      )),
    );
  }
}
