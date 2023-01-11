import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "dev-review-card.db");

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = '''
      CREATE TABLE materia (
        id INTEGER PRIMARY KEY, 
        name  VARCHAR(100));
      ''';
    await db.execute(sql);

    sql = "INSERT INTO materia (name) VALUES ('Matemática');";
    await db.execute(sql);

    sql = "INSERT INTO materia (name) VALUES ('História');";
    await db.execute(sql);

    sql = '''
      CREATE TABLE questao (
        id INTEGER PRIMARY KEY,
        pergunta VARCHAR(100), 
        descricao TEXT, 
        materiaName TEXT,
        CONSTRAINT materia_fk FOREIGN KEY (materiaName) REFERENCES materia (name));
      ''';
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, descricao, materiaName) VALUES ('1 + 1', '2', 'Matemática');";
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, descricao, materiaName) VALUES ('2 + 1', '3', 'Matemática');";
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, descricao, materiaName) VALUES ('Quem disse: Já se foi o disco voador?', 'Chaves', 'História');";
    await db.execute(sql);

    sql = '''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY, 
        email VARCHAR(100), 
        password VARCHAR(30),
        city VARCHAR(100),
        state VARCHAR(100));
      ''';
    await db.execute(sql);

    sql =
        "CREATE TABLE logged_user (id INTEGER PRIMARY KEY, email VARCHAR(100), password VARCHAR(30))";
    await db.execute(sql);

    sql =
        "INSERT INTO user (email, password) VALUES ('admin@gmail.com', 'admin')";
    await db.execute(sql);
  }
}
