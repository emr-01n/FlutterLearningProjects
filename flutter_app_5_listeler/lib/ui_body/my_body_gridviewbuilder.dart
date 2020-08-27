import 'package:flutter/material.dart';

class MyBodyGridviewBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBodyGridviewBuilderState();
}

class _MyBodyGridviewBuilderState extends State<MyBodyGridviewBuilder> {
  int crossAxisSayisi = 2;
  BoxShape shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisSayisi,
        childAspectRatio: 1, //Kare yapar
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red[
                  100 * (index % 9)], //gradient özelliğinden dolayı pasif kaldı
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/936378.jpg"),
                fit: BoxFit.fitHeight,
              ),
              border: Border.all(
                width: 5,
                color: Colors.tealAccent,
                style: BorderStyle.solid,
              ),
              /*borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),*/
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.shade900,
                  offset: Offset(10, 8),
                  blurRadius: 10,
                ),
              ],
              shape: shape, // baorderradius varsa hata verir
            ),
            child: Icon(
              Icons.person,
              size: 64,
            ),
          ),
          onTap: () {
            setState(() {
              crossAxisSayisi == 2 ? crossAxisSayisi = 3 : crossAxisSayisi = 2;
            });
          },
          onLongPress: () {
            setState(() {
              shape == BoxShape.circle ? shape = BoxShape.rectangle : shape = BoxShape.circle;
            });
          },
        );
      },
    );
  }
}

/*class MyBodyGridviewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1, //Kare yapar
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red[
                  100 * (index % 9)], //gradient özelliğinden dolayı pasif kaldı
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/936378.jpg"),
                fit: BoxFit.fitHeight,
              ),
              border: Border.all(
                width: 5,
                color: Colors.tealAccent,
                style: BorderStyle.solid,
              ),
              /*borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),*/
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.shade900,
                  offset: Offset(10, 8),
                  blurRadius: 10,
                ),
              ],
              shape: BoxShape.circle, // baorderradius varsa hata verir
            ),
            child: Icon(
              Icons.person,
              size: 64,
            ),
          ),
          onLongPress: () => debugPrint("selam"),
        );
      },
    );
  }
}
*/
