import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "review_app.db");

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = 
      '''
      CREATE TABLE materia (
        id INTEGER PRIMARY KEY, 
        name  VARCHAR(100));
      ''';
    await db.execute(sql);

    sql = "INSERT INTO materia (name) VALUES ('Matemática');";
    await db.execute(sql);

    sql = 
      '''
      CREATE TABLE questao (
        id INTEGER PRIMARY KEY,
        pergunta VARCHAR(100), 
        descricao TEXT, 
        idMateria INTEGER,
        CONSTRAINT materia_fk FOREIGN KEY (idMateria) REFERENCES materia (id));
      ''';
    await db.execute(sql);

    sql =
        "INSERT INTO questao (pergunta, descricao, idMateria) VALUES ('1 + 1', '2', 1);";
    await db.execute(sql);

    sql = 
      '''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY, 
        email varchar(100), 
        password varchar(100));
      ''';
    await db.execute(sql);

    sql =
    "CREATE TABLE logged_user (id INTEGER PRIMARY KEY, email varchar(100))";
    await db.execute(sql);

    sql =
        "INSERT INTO user (email, password) VALUES ('admin@gmail.com', 'admin')";
    await db.execute(sql);
  }

  Future<FutureOr<void>> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql =
          "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email varchar(100), password varchar(100))";
      await db.execute(sql);

      sql =
          "INSERT INTO user (email, password) VALUES ('admin@gmail.com', 'admin')";
      await db.execute(sql);
    }
  }

  Future<User> createUser(User user) async {
    Database db = await initDB();

    db
        .rawQuery("SELECT * FROM user WHERE email = '${user.email}'")
        .then((value) {
      if (value.isNotEmpty) {
        throw Exception("Usuário já existe");
      }
    });

    await db.insert("user", user.toJson());

    return user;
  }

  Future<User> login(String email, String password) async {
    Database db = await initDB();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$email' AND password = '$password'");
    if (maps.isNotEmpty) {
      logout().then( (value) async => { await db.insert('logged_user', maps.first) });
      return User.fromJson(maps.first);
    } else {
      throw Exception("Usuário não encontrado");
    }
  }

  Future<bool> logout() async {
    Database db = await initDB();
    await db.rawQuery("DELETE FROM logged_user");
    return true;
  }
}
