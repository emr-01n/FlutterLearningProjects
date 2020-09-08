class Kategori {
  int kategoriID;
  String kategoriBaslik;

  Kategori(this.kategoriBaslik);
  Kategori.withId(this.kategoriID, this.kategoriBaslik);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["kategoriID"] = kategoriID;
    map["kategoriBaslik"] = kategoriBaslik;
    return map;
  }

  Kategori.fromMap(Map<String, dynamic> map) {
    this.kategoriID = map["kategoriID"];
    this.kategoriBaslik = map["kategoriBaslik"];
  }
}
