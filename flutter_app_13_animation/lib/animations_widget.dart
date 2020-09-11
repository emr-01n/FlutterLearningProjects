import 'package:flutter/material.dart';

class AnimationWidgets extends StatefulWidget {
  @override
  _AnimationWidgetsState createState() => _AnimationWidgetsState();
}

class _AnimationWidgetsState extends State<AnimationWidgets>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double width = 150;
  double height = 150;
  double _sliderDeger = 0;
  var renk = Colors.blue;
  var aktifCocuk = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyon Kontrol"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: renk,
              ),
            ),
            RaisedButton(
              onPressed: _animated,
              child: Text("Tıkla"),
            ),
            AnimatedCrossFade(
              firstChild: Container(
                width: 150,
                height: 150,
                color: Colors.deepOrange,
              ),
              secondChild: Container(
                width: 250,
                height: 250,
                color: Colors.deepPurple,
              ),
              crossFadeState: aktifCocuk
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
            ),
            Slider(
                value: _sliderDeger,
                min: 0.0,
                max: 1.0,
                onChanged: (deger) {
                  setState(() {
                    _sliderDeger = deger;
                  });
                }),
            Transform.scale(
              scale: _sliderDeger,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animated() {
    setState(() {
      height = height == 150 ? 250 : 150;
      width = width == 150 ? 250 : 150;
      renk = renk == Colors.blue ? Colors.red : Colors.blue;
      aktifCocuk = aktifCocuk ? false : true;
    });
  }
}
