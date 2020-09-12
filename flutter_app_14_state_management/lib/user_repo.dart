import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum UserDurumu { Idle, OturumAcilmamis, OturumAciliyor, OturumAcik }

class UserReposity with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  UserDurumu _durum = UserDurumu.Idle;
  GoogleSignIn _googleSignIn;

  User get user => _user;
  set user(User value) {
    _user = value;
  }

  UserDurumu get durum => _durum;
  set durum(UserDurumu value) {
    _durum = value;
  }
  
   UserReposity() {
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    _auth.authStateChanges().listen((event) {
      _onAuthStateChange(event);
    });
  }

  Future<bool> signIn(String mail, String sifre) async {
    try {
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: mail, password: sifre);
      return true;
    } catch (e) {
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  Future<bool> googsignIn() async {
    try {
      _durum = UserDurumu.OturumAciliyor;
      notifyListeners();

      GoogleSignInAccount account = await _googleSignIn.signIn();
      GoogleSignInAuthentication _goggleAuth = await account.authentication;
      AuthCredential _authCredential = GoogleAuthProvider.credential(
          idToken: _goggleAuth.idToken, accessToken: _goggleAuth.accessToken);
      await _auth.signInWithCredential(_authCredential);
      return true;
    } catch (e) {
      _durum = UserDurumu.OturumAcilmamis;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _durum = UserDurumu.OturumAcilmamis;
    notifyListeners();
  }

 

  _onAuthStateChange(User user) {
    if (user == null) {
      _durum = UserDurumu.OturumAcilmamis;
    } else {
      _user = user;
      _durum = UserDurumu.OturumAcik;
    }
    notifyListeners();
  }
}
