import 'package:flutter/material.dart';

class ESayfasi extends StatelessWidget {
  Color renk;
  ESayfasi(this.renk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("E Sayfası Appbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "E Sayfası",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Login Yap"),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginSayfasi(Colors.purple),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "(Eğer login yaparsan geri döndüğünde bu sayfa olmayacak)",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginSayfasi extends StatelessWidget {
  Color renk;
  LoginSayfasi(this.renk);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: renk,
        title: Text("Login Sayfası Appbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tebrikler, Login Yaptınız.",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
