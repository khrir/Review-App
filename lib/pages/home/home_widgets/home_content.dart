import 'package:flutter/material.dart';
import 'package:review_app/data/materia_data_sample.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/pages/home/home_widgets/controller/home_list_item.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  static List<MateriaModel> listMocked = MateriaDataSample.materiaList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2C0469),
            Color.fromARGB(255, 182, 1, 202),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: ListView.builder(
        itemCount: listMocked.length,
        itemBuilder: (context, index) {
          return HomeListItem(
            materias: listMocked[index],
          );
        },
      ),
    );
  }
}
