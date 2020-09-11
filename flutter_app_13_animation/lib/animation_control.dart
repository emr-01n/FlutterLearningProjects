import 'package:flutter/material.dart';

class AnimasyonKontrol extends StatefulWidget {
  @override
  _AnimasyonKontrolState createState() => _AnimasyonKontrolState();
}

class _AnimasyonKontrolState extends State<AnimasyonKontrol>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    animationController.addListener(() {
      setState(() {
        print(animationController.value.toString());
      });
    });

    animationController.forward().orCancel;
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse().orCancel;
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward().orCancel;
      }
    });
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
      body: Center(
        child: Container(
          width: 100*animationController.value,
          height: 100*animationController.value,
          color: Colors.red,
        ),
      ),
    );
  }
}
