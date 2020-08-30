import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tasarım',
      theme: ThemeData(
        fontFamily: "El Yazisi",
        primarySwatch: Colors.amber,
      ),
      home: Drawer(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Flutter Tasarım",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FontBody(),
    );
  }
}

class FontBody extends StatefulWidget {
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

class Drawer extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  double vali = 0;
  InnerDrawerDirection yon = InnerDrawerDirection.start;
  Color renk = Colors.amber;
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true, // default false
      swipe: true, // default true
      colorTransitionChild: Colors.blue, // default Color.black54
      colorTransitionScaffold: Colors.black54, // default Color.black54

      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0.05, right: 0.0, left: 0.4),

      scale: IDOffset.horizontal(1.0), // set the offset in both directions

      proportionalChildArea: true, // default true
      borderRadius: 30, // default 0
      leftAnimationType: InnerDrawerAnimation.static, // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(
          color: Colors.green), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      onDragUpdate: (double val, InnerDrawerDirection direction) {
        vali = val;
        yon = direction;

        if (vali == 1.0 && yon == InnerDrawerDirection.start) {
          setState(() {
            renk = Colors.teal;
          });
        } else if (vali == 1.0 && yon == InnerDrawerDirection.end) {
          setState(() {
            renk = Colors.indigoAccent;
          });
        } else {
          setState(() {
            renk = Colors.amber;
          });
        }
        // return values between 1 and 0
        print(vali);
        print(yon);
        //print(val);
        // check if the swipe is to the right or to the left
        //print(direction == InnerDrawerDirection.start);
      },

      innerDrawerCallback: (a) =>
          print(a), // return  true (open) or false (close)
      leftChild: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text("Emre Akcin"),
                subtitle: Text(index.toString()),
              ),
            );
          },
          itemCount: 5,
        ),
      ), // required if rightChild is not set
      rightChild: Container(), // requir
      scaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              
              setState(() {
                _innerDrawerKey.currentState.toggle(direction: InnerDrawerDirection.start);
                _innerDrawerKey.currentState.open();
              });
            },
          ),
          title: Text(
            "Flutter Tasarım",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Container(
          color: renk,
          child: Center(
            child: Text(
              "Emre Akcin",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    _innerDrawerKey.currentState.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        direction: InnerDrawerDirection.end);
  }
}
