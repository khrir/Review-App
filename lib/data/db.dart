import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';

class BD {
  static List<MateriaModel> materias = [
    MateriaModel(name: 'História', qtdTopicos: 2),
    MateriaModel(name: 'Biologia', qtdTopicos: 3),
  ];

  static List<QuestionModel> questoes = [
    QuestionModel(
      pergunta: '1 + 1',
      descricao: '2',
      idMateria: 1,
    ),
    QuestionModel(
      pergunta: 'Quem disse "Já se foi o disco voador"?',
      descricao: 'Chavez',
      idMateria: 2,
    ),
    QuestionModel(
        pergunta: 'Fator predominante para a definição do sexo da tartaruga',
        descricao: 'A temperatura da areia',
        idMateria: 3)
  ];

  static Future<List<MateriaModel>> listarMaterias() async {
    await Future.delayed(const Duration(seconds: 5));
    return materias;
  }

  static Future<List<QuestionModel>> listarQuestoes() async {
    await Future.delayed(const Duration(seconds: 5));
    return questoes;
  }
}
