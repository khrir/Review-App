import 'package:review_app/models/questao_model.dart';

class MateriaModel {
  final String id;
  final String name;
  final List<Questao> listQuestao;

  MateriaModel({
    required this.id,
    required this.name,
    required this.listQuestao,
  });
}
