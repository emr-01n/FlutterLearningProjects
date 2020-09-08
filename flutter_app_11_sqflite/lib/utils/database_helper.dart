import 'dart:async';
import 'dart:io';

import 'package:flutter_app_11_sqflite/models/ogrenci.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;

  String _tabloAdi = "ogrenci";
  String _columnId = "id";
  String _columnAd = "ad";
  String _columnAktif = "aktiflik";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }
  DatabaseHelper._internal();

  static Database _database;

  Future<Database> _getDatabase() async {
    if (_database == null)
      return _database = await _initializeDatabase();
    else
      return _database;
  }

  _initializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String dbPath = join(klasor.path, "ogrenci.db");
    var ogrenciDB = await openDatabase(dbPath, version: 1, onCreate: _createDB);
    return ogrenciDB;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_tabloAdi ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT, $_columnAd TEXT, $_columnAktif INTEGER )");
  }

  Future<int> ogrenciEkle(Ogrenci ogrenci) async {
    var db = await _getDatabase();
    var sonuc = await db.insert(_tabloAdi, ogrenci.toMap(),
        nullColumnHack: "$_columnId");
    return sonuc;
  }


  Future<List<Map<String, dynamic>>> tumOgrenciler() async {
    var db = await _getDatabase();
    var sonuc = await db.query(_tabloAdi, orderBy: "$_columnId DESC");
    return sonuc;
  }

  Future<int> ogrenciGuncelle(Ogrenci ogrenci) async {
    var db = await _getDatabase();
    var sonuc = await db.update(
      _tabloAdi,
      ogrenci.toMap(),
      where: "$_columnId = ?",
      whereArgs: [ogrenci.id],
    );
    return sonuc;
  }

  Future<int> ogrenciSil(int id) async {
    var db = await _getDatabase();
    var sonuc = await db.delete(
      _tabloAdi,
      where: "$_columnId = ?",
      whereArgs: [id],
    );
    return sonuc;
  }

  Future<int> tumTabloyuSil() async {
    var db = await _getDatabase();
    var sonuc = await db.delete(_tabloAdi);
    return sonuc;
  }
}
