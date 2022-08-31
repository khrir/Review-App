import 'package:review_app/models/materia_model.dart';
import 'package:review_app/data/question_data_sample.dart';

// TODO: seria bom fazer um verificar para comparar o id da matéria com o id_fk da questão.

class MateriaDataSample {
  List<MateriaModel> materiaList = [
    MateriaModel(
      id: 1,
      name: 'Matemática',
      listQuestao: [
        QuestionDataSample.questionList[0],
        QuestionDataSample.questionList[1],
      ],
    ),
    MateriaModel(
      id: 2,
      name: 'Português',
      listQuestao: [
        QuestionDataSample.questionList[2],
        QuestionDataSample.questionList[3],
      ],
    ),
    MateriaModel(
      id: 3,
      name: 'História',
      listQuestao: [
        QuestionDataSample.questionList[4],
        QuestionDataSample.questionList[5],
      ],
    ),
    MateriaModel(
      id: 4,
      name: 'Inglês',
      listQuestao: [
        QuestionDataSample.questionList[6],
        QuestionDataSample.questionList[7],
      ],
    ),
  ];
}