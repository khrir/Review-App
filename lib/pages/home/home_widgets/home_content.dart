import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home_widgets/controller/home_list_item.dart';
import 'package:review_app/pages/home/home_widgets/model/home_list_model.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<HomeListModel> listMockedList = [
    HomeListModel(materiaName: "Português", qtdTopicos: 2),
    HomeListModel(materiaName: "Matemática", qtdTopicos: 7),
    HomeListModel(materiaName: "História", qtdTopicos: 0),
    HomeListModel(materiaName: "English", qtdTopicos: 3),
  ];
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
        itemCount: listMockedList.length,
        itemBuilder: (context, index) {
          return HomeListItem(
            homeListModel: listMockedList[index],
          );
        },
      ),
    );
  }
}
