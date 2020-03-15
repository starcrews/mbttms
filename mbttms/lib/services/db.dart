import 'dart:async';
import 'package:mbttms/models/models.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

    static int get _version => 1;

    static Future<void> init() async {

      if (_db != null) { return; }

      try {
        String _path = await getDatabasesPath() + 'example';
        _db = await openDatabase(_path, version: _version, onCreate: onCreate);
      }
      catch(ex) { 
        print(ex);
      }
    }

    static void onCreate(Database db, int version) async => 
      await db.execute('CREATE TABLE booked_flights (user_id INTEGER PRIMARY KEY NOT NULL, departureDate STRING, arrivalDate STRING, airline STRING, price STRING, destination STRING, origin STRING, time STRING, currency STRING)');

    static Future<List<Map<String, dynamic>>> query(String table) async => _db.query(table);

    static Future<int> insert(String table, Model model) async =>
        await _db.insert(table, model.toMap());
    
    static Future<int> delete(String table, Model model) async =>
        await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}