import 'package:flutter/material.dart';

class TweenKullanimi extends StatefulWidget {
  @override
  _TweenKullanimiState createState() => _TweenKullanimiState();
}

class _TweenKullanimiState extends State<TweenKullanimi>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation, animation2, animation3, animation4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController);
    animation2 = BorderRadiusTween(
            begin: BorderRadius.circular(0), end: BorderRadius.circular(50))
        .animate(animationController);
    animation4 =
        CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    animation3 =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .animate(animation4);

    animationController.addListener(() {
      setState(() {
        print("ac " + animationController.value.toString());
        print("a " + animation.value.toString());
      });
    });

    animationController.repeat(reverse: true);
    // animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse().orCancel;
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward().orCancel;
    //   }
    // });
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
      body: Align(
        alignment: animation3.value,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: animation.value,
            borderRadius: animation2.value,
          ),
        ),
      ),
    );
  }
}
