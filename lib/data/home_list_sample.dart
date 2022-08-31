import 'package:review_app/data/materia_data_sample.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/pages/home/home_widgets/model/home_list_model.dart';

class HomeListSample {
  static List<MateriaModel> listMateria = MateriaDataSample.materiaList;

  static List<HomeListModel> listMocked = [
    HomeListModel(
      materiaName: listMateria[0].name,
      qtdTopicos: 2,
    ),
    HomeListModel(
      materiaName: listMateria[1].name,
      qtdTopicos: 7,
    ),
    HomeListModel(
      materiaName: listMateria[2].name,
      qtdTopicos: 0,
    ),
    HomeListModel(
      materiaName: listMateria[3].name,
      qtdTopicos: 3,
    ),
  ];
}
