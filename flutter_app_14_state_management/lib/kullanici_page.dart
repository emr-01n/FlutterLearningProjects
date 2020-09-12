import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/user_repo.dart';
import 'package:provider/provider.dart';

class KullaniciEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserReposity userRepo, child) => Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcı Ekranı"),
        ),
        body: Column(
          children: [
            Center(
              child: Text("Kullanıcı: ${userRepo.user.email}"),
            ),
            RaisedButton(
              onPressed: () {
                userRepo.signOut();
              },
              child: Text("SignOut"),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
