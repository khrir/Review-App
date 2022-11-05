class MateriaModel {
  int? id;
  late final String name;
  int? qtdTopicos;

  MateriaModel({
    this.id,
    required this.name,
    this.qtdTopicos,
  });

  MateriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
