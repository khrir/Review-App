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
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE materia (id INTEGER PRIMARY KEY AUTOINCREMENT, name  VARCHAR(100));';
    await db.execute(sql);

    sql =
        'CREATE TABLE questao (id INTEGER PRIMARY KEY AUTOINCREMENT, pergunta VARCHAR(100), resposta TEXT, id_materia INTEGER FOREIGN KEY);';
    await db.execute(sql);

    sql =
        "INSERT INTO materia (name) VALUES ('Matemática');";
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, questao, id_materia) VALUES ('1 + 1', '2', 1);";
    await db.execute(sql);
  }
}
