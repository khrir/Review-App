import 'package:flutter/material.dart';
import 'package:review_app/data/questao_dao.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';
import 'package:review_app/pages/cards/card_page.dart';

class HomeListItem extends StatefulWidget {
  final MateriaModel materias;

  const HomeListItem({Key? key, required this.materias}) : super(key: key);

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  late List<dynamic> perguntasArr = [];
  late List<dynamic> descricaoArr = [];
  late int qtdTopicos = 0;

  List<QuestionModel> _questoesList = [];

  @override
  void initState() {
    super.initState();
    _loadQuestoes();
  }

  _loadQuestoes() async {
    _questoesList = await QuestaoDao().listarQuestoes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    for (var el in _questoesList) {
      if (el.materiaName == widget.materias.name) {
        perguntasArr.add(el.pergunta);
        descricaoArr.add(el.descricao);
        qtdTopicos++;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  widget.materias.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("0 de ${perguntasArr.length} tópicos revisados"),
                // Add progress bar
                const SizedBox(height: 15),
                const SizedBox(
                  width: 300,
                  height: 20,
                  child: LinearProgressIndicator(
                    value: 0.1,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    backgroundColor: Color.fromARGB(255, 94, 55, 55),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 227, 226, 226),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CardPage(
                                    materia: widget.materias,
                                    questao: perguntasArr,
                                    descricao: descricaoArr,
                                  )));
                    },
                    child: const Center(
                      child: Text(
                        "Praticar",
                        style: TextStyle(
                            fontSize: 22, color: Color.fromRGBO(57, 57, 57, 1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
