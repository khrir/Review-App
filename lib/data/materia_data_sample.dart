import 'package:review_app/models/materia_model.dart';
import 'package:review_app/data/question_data_sample.dart';
import 'package:review_app/models/question_model.dart';

// TODO: seria bom fazer um verificar para comparar o id da matéria com o id_fk da questão.

class MateriaDataSample {
  static List<QuestionModel> questionList = QuestionDataSample.questionList;
  static List<MateriaModel> materiaList = [
    MateriaModel(
      id: 1,
      name: 'Matemática',
      qtdTopicos: 7,
      listQuestao: [
        questionList[0],
        questionList[1],
      ], 
    ),
    MateriaModel(
      id: 2,
      name: 'Português',
      qtdTopicos: 3,
      listQuestao: [
        questionList[2],
        questionList[3],
      ],
    ),
    MateriaModel(
      id: 3,
      name: 'História',
      qtdTopicos: 2,
      listQuestao: [
        questionList[4],
        questionList[5],
      ],
    ),
    MateriaModel(
      id: 4,
      name: 'Biologia',
      qtdTopicos: 3,
      listQuestao: [
        questionList[6],
        questionList[7],
      ],
    ),
  ];
}
