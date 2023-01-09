import 'package:review_app/data/db_helper.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:sqflite/sqflite.dart';

class MateriaDao {

  Future<List<MateriaModel>> listarMaterias() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM materia';
    final result = await db.rawQuery(sql);

    List<MateriaModel> lista = <MateriaModel>[];

    for(var json in result){
      MateriaModel questao = MateriaModel.fromJson(json);
      lista.add(questao);
    }

    return lista;
  }

  salvarMateria({required MateriaModel materia}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('materia', materia.toJson());
  }
}