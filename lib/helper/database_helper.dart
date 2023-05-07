import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/consultation.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
    // if (_database == null) {
    //   _database == await _initializeDb();
    // }
    // return _database;
  }

  final String _tableName = 'consultation';

  Future<Database> _initializeDb() async {
    var db = openDatabase(join(await getDatabasesPath(), 'consultation_db.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, date TEXT, psikolog TEXT, time TEXT, consult TEXT, psikologId INTEGER)''',
      );
    }, version: 3);
    return db;
  }

  Future<void> insertConsultation(Consultation consultation) async {
    final Database db = await database;
    await db.insert(_tableName, consultation.toMap());
  }

  Future<List<Consultation>> readConsultation() async {
    print('test');
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    print(results.length);
    return results.map((e) => Consultation.fromMap(e)).toList();
  }

  Future<Consultation> getConsultationById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => Consultation.fromMap(e)).first;
  }

  Future<void> updateConsultation(Consultation consultation) async {
    final db = await database;
    await db.update(
      _tableName,
      consultation.toMap(),
      where: 'id = ?',
      whereArgs: [consultation.id],
    );
  }

  Future<void> deleteConsultation(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
