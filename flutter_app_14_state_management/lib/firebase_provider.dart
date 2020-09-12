import 'package:flutter/material.dart';
import 'package:flutter_app_14_state_management/user_repo.dart';
import 'package:provider/provider.dart';

import 'kullanici_page.dart';
import 'login_page.dart';

class ProviderWithFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserReposity userRepo, child) {
      switch (userRepo.durum) {
        case UserDurumu.Idle:
          return SplashEkran();
        case UserDurumu.OturumAciliyor:
        case UserDurumu.OturumAcilmamis:
          return LoginEkrani();
        case UserDurumu.OturumAcik:
          return KullaniciEkrani();
      }
    });
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Ekran"),),
      body: Center(child: Text("Splash Ekran"),),
    );
  }
}
