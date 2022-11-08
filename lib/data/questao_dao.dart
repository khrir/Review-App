import 'package:review_app/data/db_helper.dart';
import 'package:review_app/models/question_model.dart';
import 'package:sqflite/sqflite.dart';

class QuestaoDao {
  Future<List<QuestionModel>> listarQuestoes() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM questao';
    final result = await db.rawQuery(sql);

    List<QuestionModel> lista = <QuestionModel>[];

    for (var json in result) {
      QuestionModel questao = QuestionModel.fromJson(json);
      lista.add(questao);
    }

    return lista;
  }

  salvarQuestao({required QuestionModel questao}) async {
    DBHelper dbHelper = DBHelper();
    Database database = await dbHelper.initDB();

    await database.insert('questao', questao.toJson());
  }
}
