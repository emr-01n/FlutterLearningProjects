class Ogrenci {
  String _ad;
  int _id;
  int _aktiflik;

  String get ad => _ad;
  set ad(String value) => _ad = value;

  int get id => _id;
  set id(int value) => _id = value;

  int get aktiflik => _aktiflik;
  set aktiflik(int value) => _aktiflik = value;

  Ogrenci(this._ad, this._aktiflik);
  Ogrenci.wihtId(this._ad, this._id, this._aktiflik);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map["id"] = _id;
    map["ad"] = _ad;
    map["aktiflik"] = _aktiflik;
    return map;
  }

  Ogrenci.fromMap(Map<String, dynamic> map) {
    this._id = map["id"];
    this._ad = map["ad"];
    this._aktiflik = map["aktiflik"];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Ogrenci{id : $_id, ad: $_ad, aktiflik: $_aktiflik}";
  }
}
