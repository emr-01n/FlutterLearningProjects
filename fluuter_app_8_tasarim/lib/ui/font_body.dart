import 'package:flutter/material.dart';

class FontBody extends StatefulWidget {
  FontBody(Key k) : super(key: k);
  @override
  _FontBodyState createState() => _FontBodyState();
}

class _FontBodyState extends State<FontBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Emre  Akcin",
              style: TextStyle(
                  fontFamily: 'El Yazisi',
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
