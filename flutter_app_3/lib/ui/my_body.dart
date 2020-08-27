import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: <Widget>[
              Text(
                "Image ve Buton Türleri",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset("assets/images/fener.png"),
                            Text("Assets Image"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.network(
                              "https://i.pinimg.com/originals/47/13/c1/4713c1149ee3fbf08d8d9647ce487b1d.jpg",
                            ),
                            Text("Network Image"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.orange,
                              radius: 60,
                              backgroundImage: NetworkImage(
                                "https://i.pinimg.com/originals/47/13/c1/4713c1149ee3fbf08d8d9647ce487b1d.jpg",
                              ),
                            ),
                            Text("Circle Avatar"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 350,
                      ),
                      margin: EdgeInsets.all(2),
                      color: Colors.red.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FadeInImage.assetNetwork(
                            placeholder: "assets/images/loading.gif",
                            image:
                                "https://i.pinimg.com/originals/47/13/c1/4713c1149ee3fbf08d8d9647ce487b1d.jpg",
                          ),
                          Text("FadeIn Image"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: RaisedButton(
                      child: Text("Emre Akcin"),
                      elevation: 30,
                      onPressed: () {},
                      textColor: Colors.blueAccent,
                      hoverColor: Colors.blueGrey,
                      autofocus: true,
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          );
  }


}