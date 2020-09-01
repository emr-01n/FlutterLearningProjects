import 'package:flutter/material.dart';
import 'dart:math' as mat;

class DetayPage extends StatefulWidget {
  var imgPath;
  DetayPage({this.imgPath});
  @override
  _DetayPageState createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  double drag = 0;
  int control = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          if (details.delta.dy.abs() > 0) {
            drag = details.delta.dy.abs();
            control = 1;
            if (drag > 15) {
              Navigator.of(context).pop();
            } else {
              drag = 0;
            }
          }
          ;
        });
        print(drag);
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(drag),
          child: Stack(
            children: [
              Hero(
                tag: widget.imgPath,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                  ),
                ),
              ),
              alimKutusu(),
            ],
          ),
        ),
      ),
    );
  }

  Widget alimKutusu() {
    if (drag > 0) {
      return Container();
    } else {
      return Positioned(
        bottom: 15,
        left: 15,
        right: 15,
        height: 210,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(1),
          color: Colors.white.withOpacity(0.8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            width: 0,
                            color: Colors.transparent,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/dress.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LAMINATED",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Louis vuitton",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 200,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras urna dui, elementum ut justo nec",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(height: 0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$65000",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
