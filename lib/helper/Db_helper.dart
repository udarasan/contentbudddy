import 'dart:io';

import 'package:contentbudddy/model/Contacts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class Db_helper{
  Db_helper._privateConstructor();
  static final Db_helper instance =Db_helper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path =join(documentDirectory.path,'contactapp.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db,int version) async {
    await db.execute('''
    CREATE TABLE contacts(
      id INTEGER PRIMARY KEY,
      name TEXT,
      number TEXT,
      email TEXT
    )
    ''');
  }

  Future<List<Contacts>> getContacts() async{
    Database db =await instance.database;
    var contacts = await db.query('contacts', orderBy: 'name');
    List<Contacts> contactList = contacts.isNotEmpty
        ? contacts.map((c) => Contacts.fromMap(c)).toList()
        : [];
    return contactList;
  }
  Future<int> add(Contacts contacts) async {
    Database db = await instance.database;
    return await db.insert('contacts', contacts.toMap());
  }
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('contacts',where: "id = ?", whereArgs: [id]);
  }
  Future<int> update(Contacts contacts) async {
    Database db = await instance.database;
    return await db.update('contacts', contacts.toMap(),
        where: "id = ?", whereArgs: [contacts.id]);
  }

}