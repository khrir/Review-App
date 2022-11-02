import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "cards.db");

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = '''
        CREATE TABLE materia (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name  VARCHAR(100));
        ''';
    await db.execute(sql);

    sql = '''
        CREATE TABLE questao (
          id INTEGER AUTOINCREMENT PRIMARY KEY,
          pergunta VARCHAR(100), 
          resposta TEXT, 
          id_materia INTEGER,
          CONSTRAINT materia_fk FOREIGN KEY (id_materia) REFERENCES materia (id));
        ''';
    await db.execute(sql);

    sql = "INSERT INTO materia (name) VALUES ('Matemática');";
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, questao, id_materia) VALUES ('1 + 1', '2', 1);";
    await db.execute(sql);
  }

  Future<FutureOr<void>> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql = '''
        CREATE TABLE user (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          email varchar(100), 
          password varchar(100));
        ''';
      await db.execute(sql);

      sql =
          "INSERT INTO user (email, password) VALUES ('admin@gmail.com', 'admin')";
      await db.execute(sql);
    }
  }
}
