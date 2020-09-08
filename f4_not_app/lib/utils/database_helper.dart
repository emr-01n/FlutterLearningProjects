import 'dart:async';
import 'dart:io';
import 'package:f4_not_app/model/kategori.dart';
import 'package:f4_not_app/model/notlar.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }
  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    // Daha verimli olması için utils altındaki değil uygulama içinde oluşturduğumuz kopyayı kullancağız.
    // Database'in bulunacağı klasörün path'ini getirir. Sonra ismi ile birleştirir ve bir path elde ederiz.
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "notAPP.db");

    // Elde edile path de database olup olmadığı kontrol edilir.
    var exists = await databaseExists(path);

    //Eğer yoksa sadece uygulama ilk defa açıldığında bir kopya oluşturulur.
    if (!exists) {
      print("Creating new copy from asset");

      // Üst klasörlerin olup olmadığından emin olmaya çalışırız. Yoksa oluştururuz.
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Assets altına yüklediğim databasenin kopyasını çıkartırız
      ByteData data = await rootBundle.load(join("assets/data", "notlar.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written(Belirtilen path'e yazma işlemi gerçekleştirilir.)
      await File(path).writeAsBytes(bytes, flush: true);
    }
    // Eğer varsa birşey yapmayız
    else {
      print("Opening existing database");
    }

    // Var olan veya yeni var edilen databaseyi açarız ve returnleriz.
    var db = await openDatabase(path, readOnly: false);
    return db;
  }

  Future<List<Map<String, dynamic>>> kategorileriGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("kategori");
    return sonuc;
  }

  Future<int> kategoriEkle(Kategori kategori) async {
    var db = await _getDatabase();
    var sonuc = await db.insert("kategori", kategori.toMap());
    return sonuc;
  }

  Future<int> kategoriGuncelle(Kategori kategori) async {
    var db = await _getDatabase();
    var sonuc = await db.update("kategori", kategori.toMap(),
        where: "kategoriID = ?", whereArgs: [kategori.kategoriID]);
    return sonuc;
  }

  Future<int> kategoriSil(int kategoriID) async {
    var db = await _getDatabase();
    var sonuc =
        db.delete("kategori", where: "kategoriID = ?", whereArgs: [kategoriID]);
    return sonuc;
  }

  Future<List<Map<String, dynamic>>> notGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("not", orderBy: "notID DESC");
    return sonuc;
  }
  Future<List<Map<String, dynamic>>> birNotGetir(int notID) async {
    var db = await _getDatabase();
    var sonuc = await db.query("not", where: "notID = ?",whereArgs: [notID]);
    return sonuc;
  }

  Future<int> notEkle(Notlar not) async {
    var db = await _getDatabase();
    var sonuc = await db.insert("not", not.toMap());
    return sonuc;
  }

  Future<int> notGuncelle(Notlar not) async {
    var db = await _getDatabase();
    var sonuc = await db.update("not", not.toMap(),
        where: "notID = ?", whereArgs: [not.notID]);
    return sonuc;
  }

  Future<int> notSil(int notID) async {
    var db = await _getDatabase();
    var sonuc =
        db.delete("kategori", where: "notID = ?", whereArgs: [notID]);
    return sonuc;
  }
}
