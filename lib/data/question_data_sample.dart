import 'package:review_app/models/question_model.dart';

class QuestionDataSample {
  static List<QuestionModel> questionList = [
    QuestionModel(id: 1, idMateriaFk: 1, pergunta: '2 + 3'),
    QuestionModel(id: 2, idMateriaFk: 1, pergunta: '3 + 3'),
    QuestionModel(id: 3, idMateriaFk: 2, pergunta: 'Eu, tu...'),
    QuestionModel(id: 4, idMateriaFk: 2, pergunta: 'Nós bota nela'),
    QuestionModel(id: 5, idMateriaFk: 3, pergunta: 'Que time teu?'),
    QuestionModel(id: 6, idMateriaFk: 3, pergunta: 'Quem foi Colombo?'),
    QuestionModel(id: 7, idMateriaFk: 4, pergunta: 'Fish, ball, cat'),
    QuestionModel(id: 8, idMateriaFk: 4, pergunta: 'You damn'),
  ];
}
