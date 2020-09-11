import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String mesaj = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.authStateChanges().listen((user) {
      setState(() {
        if (user != null) {
          mesaj += "\nGiriş yapmış bir kullanıcı var";
        } else {
          mesaj += "\nGiriş yapmış bir kullanıcı yok";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş İşlemleri"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                color: Colors.green,
                onPressed: _emailKayit,
                child: Text(
                  "Email/Şİfre ile kayıt",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.orange,
                onPressed: _emailGiris,
                child: Text(
                  "Email/Şİfre ile Giriş",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: _exit,
                child: Text(
                  "Çıkış yap",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.purple,
                onPressed: _sifreUnutma,
                child: Text(
                  "Şifremi unuttum",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.teal,
                onPressed: _sifreGuncelle,
                child: Text(
                  "Şifremi güncelle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.pink,
                onPressed: _googleGiris,
                child: Text(
                  "Google ile Giriş",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: _veriEkle,
                child: Text(
                  "Veri Ekle",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: _transactionsParaGonder,
                child: Text(
                  "Para Gönder",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.yellow,
                onPressed: _kullaniciSil,
                child: Text(
                  "Kullanıcı Sil",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.brown,
                onPressed: _yasSil,
                child: Text(
                  "Yaş kısmını Sil",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.blue.shade300,
                onPressed: _veriOku,
                child: Text(
                  "Veri oku",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.red.shade300,
                onPressed: _canliVeriOku,
                child: Text(
                  "Canlı Veri oku",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.red.shade300,
                onPressed: _veriSorgula,
                child: Text(
                  "Veri Sorgula",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(mesaj),
            ],
          ),
        ),
      ),
    );
  }

  void _emailKayit() async {
    String mail = "emre.akcin342@gmail.com";
    String pass = "123456";

    var setFirebaseUser = await auth
        .createUserWithEmailAndPassword(email: mail, password: pass)
        .catchError((e) => debugPrint(e.toString()));
    var user;
    if (setFirebaseUser != null) {
      user = setFirebaseUser.user;
    }
    if (user != null) {
      user
          .sendEmailVerification()
          .then((data) => auth.signOut())
          .catchError((e) => print(e.toString()));
      setState(() {
        mesaj =
            "\n${user.uid}\n${user.email}\n${user.emailVerified}\ndoğrulama email yollandı\nçıkış yapıldı";
      });
      print("${user.uid} // ${user.email} // ${user.emailVerified}");
    } else {
      setState(() {
        mesaj += "\nuser null email kayıtlı";
      });
    }
  }

  void _emailGiris() {
    String mail = "emre.akcin342@gmail.com";
    String pass = "123456";

    auth
        .signInWithEmailAndPassword(email: mail, password: pass)
        .then((userCredit) {
      var user = userCredit.user;
      if (!user.emailVerified) {
        setState(() {
          mesaj += "\ne postanızı doğrulayın çıkış yapılıyor";
        });
        auth.signOut();
      } else {
        setState(() {
          mesaj += "\ngiriş yapıldı";
        });
      }
    }).catchError((e) {
      setState(() {
        mesaj += "\nGirş hatalı";
      });
    });
  }

  void _exit() {
    if (auth.currentUser != null) {
      auth.signOut().then((value) {
        setState(() {
          mesaj += "\nbaşarıyla çıkış yapıldı";
        });
      }).catchError((e) => print(e.toString()));
    } else {
      setState(() {
        mesaj += "\nAktif bir kullamıcı yok";
      });
    }
  }

  void _sifreUnutma() {
    String mail = "em_re_ak_cin@hotmail.com";
    if (auth.currentUser != null) {
      auth.sendPasswordResetEmail(email: mail).then((value) {
        setState(() {
          mesaj += "\nşifre değiştirme maili yollandı";
        });
      }).catchError((e) => print(e));
    } else {
      setState(() {
        mesaj += "\ngiriş yapan bir kullanıcı yok";
      });
    }
  }

  void _sifreGuncelle() {
    String mail = "em_re_ak_cin@hotmail.com";
    if (auth.currentUser != null) {
      auth.currentUser.updatePassword("123456").then((value) {
        setState(() {
          mesaj += "\nşifre güncelleme başarılı";
        });
      }).catchError((e) {
        setState(() {
          mesaj += "\nşifre güncelleme başarısız";
        });
      });
    } else {
      setState(() {
        mesaj += "\nGiriş yapan kullanıcı yok";
      });
    }
  }

  Future<UserCredential> _googleGiris() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  void _veriEkle() {
    firestore
        .collection("users")
        .doc("emr_01n")
        .set({
          "name": "Emre",
          "yas": 21,
          "sehir": "İzmir",
          "dil": "Türkçe",
          "para": 800
        })
        .then((value) {})
        .catchError((e) => print(e.toString()));
    firestore
        .collection("users")
        .doc("irfan_emre")
        .set({
          "name": "İrfan",
          "yas": 21,
          "sehir": "Manisa",
          "dil": "Fransızca",
          "para": 200
        })
        .then((value) {})
        .catchError((e) => print(e.toString()));
    firestore
        .collection("users")
        .doc("emr_01n")
        .set({"ayakNo": 41}, SetOptions(merge: true));

    firestore.collection("users").add({
      "name": "Yusuf",
      "yas": 16,
      "sehir": "Denizli",
      "dil": "Almanca",
      "tarih": FieldValue.serverTimestamp(),
      "sayi": FieldValue.increment(1)
    }).then((value) => print(value.id));
    firestore
        .doc("users/emr_01n")
        .update({"yas": 22, "sayi": FieldValue.increment(3)});
  }

  _transactionsParaGonder() async {
    DocumentReference emreRef = firestore.doc("users/emr_01n");
    DocumentReference irfanRef = firestore.doc("users/irfan_emre");
    // DocumentSnapshot emreData = await emreRef.get();
    // DocumentSnapshot irfanData = await irfanRef.get();

    firestore
        .runTransaction((transaction) async {
          DocumentSnapshot emreSnap = await transaction.get(emreRef);
          if (!emreSnap.exists) {
            throw Exception("Users does not exist");
          }
          var emrePara = emreSnap.data()["para"];
          if (emrePara > 100) {
            transaction.update(emreRef, {"para": FieldValue.increment(-100)});
          } else {
            throw Exception("Emre not enough money");
          }

          transaction.update(irfanRef, {"para": FieldValue.increment(100)});
        })
        .then((value) => print("$value ..."))
        .catchError((e) => print(e));
  }

  void _kullaniciSil() {
    firestore
        .doc("users/irfan_emre")
        .delete()
        .then((value) => print("irfan silindi"))
        .catchError((e) => print("$e"));
  }

  void _yasSil() {
    firestore.doc("users/emr_01n").update({"yas": FieldValue.delete()});
  }

  void _veriOku() async {
    DocumentSnapshot emreSnap = await firestore.doc("users/emr_01n").get();
    var emreMapData = emreSnap.data();
    print(emreMapData.toString());
    emreMapData.forEach((key, value) {
      print("$key : $value");
    });
  }

  void _canliVeriOku() {
    firestore.doc("users/emr_01n").snapshots().listen((event) {
      setState(() {
        var emreMapData = event.data();
        print(emreMapData);

        mesaj = "${emreMapData["para"].toString()}";
      });
    });
  }

  void _veriSorgula() async {
    QuerySnapshot sorguSnap = await firestore
        .collection("users")
        .where("yas", isEqualTo: 21)
        .get();
    if(sorguSnap.docs.length != 0){
      List<QueryDocumentSnapshot> sorguListDoc = sorguSnap.docs;
    sorguListDoc.forEach((element) {
      print(element.data());
    });
    }else{
      print("sorgu yok");
    }
   
  }
}
