import 'package:flutter/material.dart';

class StaggeredAnimations extends StatefulWidget {
  @override
  _StaggeredAnimationsState createState() => _StaggeredAnimationsState();
}

class _StaggeredAnimationsState extends State<StaggeredAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation, animation2,animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(50),
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.5, curve: Curves.decelerate)));
    animationController.repeat(reverse: true);

    animation2 = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.decelerate)));
    animationController.repeat(reverse: true);

    animation3 = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1, curve: Curves.decelerate)));
    animationController.repeat(reverse: true);
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
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Align(
          child: Container(
            width: animation2.value,
            height: animation2.value,
            decoration: BoxDecoration(
              color: animation3.value,
              borderRadius: animation.value,
            ),
          ),
        ),
      ),
    );
  }
}
