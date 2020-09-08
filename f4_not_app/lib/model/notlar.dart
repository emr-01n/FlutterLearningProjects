class Notlar {
  int notID;
  int kategoriID;
  String notBaslik;
  String notIcerik;
  String notTarih;
  int notOncelik;

  Notlar(this.kategoriID, this.notBaslik, this.notIcerik, this.notTarih,
      this.notOncelik);
  Notlar.withId(this.notID, this.kategoriID, this.notBaslik, this.notIcerik,
      this.notTarih, this.notOncelik);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["notID"] = notID;
    map["kategoriID"] = kategoriID;
    map["notBaslik"] = notBaslik;
    map["notIcerik"] = notIcerik;
    map["notTarih"] = notTarih;
    map["notOncelik"] = notOncelik;
    return map;
  }

  Notlar.fromMap(Map<String, dynamic> map) {
    this.notID = map["notID"];
    this.kategoriID = map["kategoriID"];
    this.notBaslik = map["notBaslik"];
    this.notIcerik = map["notIcerik"];
    this.notTarih = map["notTarih"];
    this.notOncelik = map["notOncelik"];
  }
}
