class QuestionModel {
  int? id;
  late final String pergunta;
  late final String descricao;
  late final int idMateria;

  QuestionModel({
    this.id,
    required this.pergunta,
    required this.descricao,
    required this.idMateria,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pergunta = json['pergunta'];
    descricao = json['descricao'];
    idMateria = json['idMateria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pergunta'] = pergunta;
    data['descricao'] = descricao;
    data['idMateria'] = idMateria;
    return data;
  }
}
