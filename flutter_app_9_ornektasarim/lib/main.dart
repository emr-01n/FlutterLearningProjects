import 'package:flutter/material.dart';
import 'package:flutter_app_9_ornektasarim/detay.dart';
import 'package:camera/camera.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

var contextemre;
List<CameraDescription> cameras;
Future<void> cameraCalistir() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Navigator.of(contextemre)
      .push(MaterialPageRoute(builder: (context) => CameraApp()));
  //runApp(CameraApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasarim Uygulamasi',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var list;
  var elemanSayisi = 0.0;
  var myCont;
  @override
  void initState() {
    super.initState();
    myCont = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contextemre = context;
    list = listeOlustur();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: TabBar(
          controller: myCont,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.black54,
                size: 20,
              ),
              child: Text(
                "Home",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                color: Colors.black54,
                size: 20,
              ),
              child: Text(
                "Search",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings,
                color: Colors.black54,
                size: 20,
              ),
              child: Text(
                "Setting",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Postgram",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cameraCalistir();
            },
            icon: Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Story Kısmı
            Container(
              height: 150,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: genislikHesapla(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: list,
                    ),
                  ),
                ],
              ),
            ),

            //Post Kısmı
            Column(
              children: postOlustur(),
            ),
          ],
        ),
      ),
    );
  }

  //Story Liste
  List<Widget> listeOlustur() {
    List<Widget> liste = [
      listeElemaniOlustur(
          "assets/images/model1.jpeg", "assets/images/chanellogo.jpg"),
      listeElemaniOlustur(
          "assets/images/model2.jpeg", "assets/images/fener.jpg"),
      listeElemaniOlustur(
          "assets/images/model3.jpeg", "assets/images/barca.png"),
      listeElemaniOlustur(
          "assets/images/model1.jpeg", "assets/images/chanellogo.jpg"),
      listeElemaniOlustur(
          "assets/images/model2.jpeg", "assets/images/kartal.png"),
      listeElemaniOlustur(
          "assets/images/model3.jpeg", "assets/images/fener.jpg"),
    ];
    setState(() {
      elemanSayisi = liste.length.toDouble();
    });

    return liste;
  }

  //Story liste elemanları
  Widget listeElemaniOlustur(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.fill),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 80,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(
              "Follow",
              style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //Story alanı genişlik hesaplayıcı
  double genislikHesapla() {
    return (20 + (elemanSayisi * 90) + ((elemanSayisi - 1) * 15));
  }

  Widget post() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 6,
        child: Container(
          width: double.infinity,
          height: 540,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              //Kullanıcı Bilgileri kısmı ve more kısmı
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/model1.jpeg"),
                        fit: BoxFit.cover),
                  ),
                ),
                title: Text(
                  "Daisy",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "34 mins ago",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
                trailing: Icon(Icons.more_vert),
              ),
              SizedBox(height: 0),
              //Kullanıcı text kısmı
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This official website features a ribbed knit zipper jacket that is"
                  "modern and stylish. It looks very temparament and is recommend to friends",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 0),
              //Kullanıcı resim kısmı
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetayPage(
                                    imgPath: "assets/images/modelgrid2.jpeg",
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: "assets/images/modelgrid2.jpeg",
                              child: Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/modelgrid2.jpeg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetayPage(
                                          imgPath:
                                              "assets/images/modelgrid1.jpeg",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: "assets/images/modelgrid1.jpeg",
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.teal,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/modelgrid1.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 4, 8, 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetayPage(
                                          imgPath:
                                              "assets/images/modelgrid3.jpeg",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: "assets/images/modelgrid3.jpeg",
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.indigo,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/modelgrid3.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0),
              //hashtag kısmı
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 4, 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "# Louis vuitton",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "# Chloe",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 5,
                endIndent: 5,
              ),
              //yorum beğeni kısmı
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.reply,
                      color: Colors.black54,
                      size: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1.7k",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.comment,
                      color: Colors.black54,
                      size: 26,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "342",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 26,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "12.2k",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),
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

  Widget post2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 6,
        child: Container(
          width: double.infinity,
          height: 540,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              //Kullanıcı Bilgileri kısmı ve more kısmı
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/modell1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  "İrfan",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "16 mins ago",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
                trailing: Icon(Icons.more_vert),
              ),
              SizedBox(height: 0),
              //Kullanıcı text kısmı
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Bisiklet ile İzmir'e gittim. KIçım pişik oldu ama değdi."
                  "Tünele giremedik o yüzden zorlu bir yol oldu. Bu çılgınlıktan birkaç kare...",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 0),
              //Kullanıcı resim kısmı
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetayPage(
                                    imgPath: "assets/images/modell3.jpg",
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: "assets/images/modell3.jpg",
                              child: Material(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/modell3.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 8, 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetayPage(
                                          imgPath: "assets/images/modell2.jpg",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: "assets/images/modell2.jpg",
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.teal,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/modell2.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 4, 8, 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetayPage(
                                          imgPath: "assets/images/modell4.jpg",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: "assets/images/modell4.jpg",
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.indigo,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/modell4.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0),
              //hashtag kısmı
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 4, 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "# İzmir",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.4),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "# Bisiklet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 5,
                endIndent: 5,
              ),
              //yorum beğeni kısmı
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.reply,
                      color: Colors.black54,
                      size: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "2.7k",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.comment,
                      color: Colors.black54,
                      size: 26,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "456",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 26,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "18.2k",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),
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

  List<Widget> postOlustur() {
    return [
      post(),
      post2(),
    ];
  }
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}
