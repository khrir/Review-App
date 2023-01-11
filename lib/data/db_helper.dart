import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';
import 'package:review_app/models/user.dart';
import 'package:review_app/service/api/fastapi_lean.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  final fastapiLean = FastApiLean();
  List<MateriaModel> materias = [];
  List<QuestionModel> questoes = [];
  List<User> usuarios = [];

  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "power-ranger8.db");

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    materias = await fastapiLean.getMateriasData();
    questoes = await fastapiLean.getQuestoesData();
    usuarios = await fastapiLean.getUsersData();

    String sql = '''
      CREATE TABLE materia (
        id INTEGER PRIMARY KEY, 
        name  VARCHAR(100));
      ''';
    await db.execute(sql);

    for (var element in materias) {
      sql = "INSERT INTO materia (name) VALUES ('${element.name}');";
      await db.execute(sql);
    }

    sql = '''
      CREATE TABLE questao (
        id INTEGER PRIMARY KEY,
        pergunta VARCHAR(100), 
        descricao TEXT, 
        materiaName TEXT,
        CONSTRAINT materia_fk FOREIGN KEY (materiaName) REFERENCES materia (name));
      ''';
    await db.execute(sql);

    for (var element in questoes) {
      sql =
          "INSERT INTO questao (pergunta, descricao, materiaName) VALUES ('${element.pergunta}','${element.descricao}','${element.materiaName}');";
      await db.execute(sql);
    }

    sql = '''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY, 
        email VARCHAR(100), 
        password VARCHAR(30),
        city VARCHAR(100),
        state VARCHAR(100));
      ''';
    await db.execute(sql);

    for (var element in usuarios) {
      sql =
          "INSERT INTO user (email, password, city, state) VALUES ('${element.email}', '${element.password}', '${element.city}', '${element.state}')";
      await db.execute(sql);
    }

    sql = '''
        CREATE TABLE logged_user (
          id INTEGER PRIMARY KEY, 
          email VARCHAR(100), 
          password VARCHAR(30),
          city VARCHAR(100),
          state VARCHAR(100));
        ''';
    await db.execute(sql);
  }
}
