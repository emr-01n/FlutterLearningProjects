class Burc {
  String _ad;
  String _dosyaAd;
  String _tarih;
  String _aciklama;
  String _icon;
  String _foto;

  Burc(this._ad, this._dosyaAd, this._tarih, this._aciklama, this._icon,
      this._foto);

  // ignore: unnecessary_getters_setters
  String get ad => _ad;
  // ignore: unnecessary_getters_setters
  String get dosyaAd => _dosyaAd;
  // ignore: unnecessary_getters_setters
  String get tarih => _tarih;
  // ignore: unnecessary_getters_setters
  String get aciklama => _aciklama;
  // ignore: unnecessary_getters_setters
  String get icon => _icon;
  // ignore: unnecessary_getters_setters
  String get foto => _foto;

  // ignore: unnecessary_getters_setters
  set ad(String value) {
    _ad = value;
  }
  // ignore: unnecessary_getters_setters
  set dosyaAd(String value) {
    _dosyaAd = value;
  }
  // ignore: unnecessary_getters_setters
  set tarih(String value) {
    _tarih = value;
  }
  // ignore: unnecessary_getters_setters
  set aciklama(String value) {
    _aciklama = value;
  }
  // ignore: unnecessary_getters_setters
  set icon(String value) {
    _icon = value;
  }
  // ignore: unnecessary_getters_setters
  set foto(String value) {
    _foto = value;
  }
}
