import 'package:review_app/models/question_model.dart';

class MateriaModel {
  final int id;
  final String name;
  final List<QuestionModel> listQuestao;

  MateriaModel({
    required this.id,
    required this.name,
    required this.listQuestao,
  });
}
