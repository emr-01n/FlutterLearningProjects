import 'package:flutter/widgets.dart';

class Sayac with ChangeNotifier {
  int _sayac;

  Sayac(this._sayac);

  int get sayac => _sayac;
  set sayac(int value) => _sayac = value;

  void arttir() {
    _sayac++;
    notifyListeners();
  }

  void azalt() {
    _sayac--;
    notifyListeners();
  }
}
