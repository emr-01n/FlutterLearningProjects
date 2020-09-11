import 'package:flutter/material.dart';

class AnimasyonApp extends StatefulWidget {
  @override
  _AnimasyonAppState createState() => _AnimasyonAppState();
}

class _AnimasyonAppState extends State<AnimasyonApp>
    with SingleTickerProviderStateMixin {
  final TextStyle menuStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  double ekranYuksekligi, ekranGenisligi;
  bool menuTiklandiMi = false;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;
  final Duration _duration = Duration(milliseconds: 500);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _controller.addListener(() {
      setState(() {});
    });
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranGenisligi = MediaQuery.of(context).size.width;
    ekranYuksekligi = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 62, 80),
        body: Stack(
          children: [
            _menuOlustur(),
            _dashBoard(),
          ],
        ),
      ),
    );
  }

  _menuOlustur() {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment(-1, -0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: menuStyle,
              ),
              SizedBox(height: 25),
              Text(
                "Homepage",
                style: menuStyle,
              ),
              SizedBox(height: 25),
              Text(
                "Branches",
                style: menuStyle,
              ),
              SizedBox(height: 25),
              Text(
                "Utility Layer",
                style: menuStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _dashBoard() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: 0,
      bottom: 0,
      left: menuTiklandiMi ? 0.3 * ekranGenisligi : 0,
      width: ekranGenisligi,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: menuTiklandiMi
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          elevation: 8,
          color: Color.fromARGB(255, 44, 62, 80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (menuTiklandiMi) {
                            _controller.reverse();
                          } else {
                            _controller.forward();
                          }
                          menuTiklandiMi = !menuTiklandiMi;
                        });
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Text(
                      "My Cards",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 32,
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
