import 'package:flutter/material.dart';
import 'package:review_app/data/materia_dao.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/pages/home/home_widgets/controller/home_list_item.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
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
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: buildListView(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildListView() {
    Future<List<MateriaModel>> futureList = MateriaDao().listarMaterias();

    return FutureBuilder<List<MateriaModel>>(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MateriaModel> listaMateria = snapshot.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listaMateria.length,
            itemBuilder: (context, index) {
              return HomeListItem(
                materias: listaMateria[index],
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
