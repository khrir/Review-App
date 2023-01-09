class QuestionModel {
  int? id;
  late final String pergunta;
  late final String descricao;
  late final String materiaName;

  QuestionModel({
    this.id,
    required this.pergunta,
    required this.descricao,
    required this.materiaName,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pergunta = json['pergunta'];
    descricao = json['descricao'];
    materiaName = json['materiaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pergunta'] = pergunta;
    data['descricao'] = descricao;
    data['materiaName'] = materiaName;
    return data;
  }
}
