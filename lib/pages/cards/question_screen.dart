import 'package:flutter/material.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';
import 'package:review_app/pages/cards/answer_screen.dart';

import '../app_bar/app_bar.dart';

class QuestionPage extends StatefulWidget {
  final MateriaModel materia;
  const QuestionPage({Key? key, required this.materia}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final List<QuestionModel> questoes = widget.materia.listQuestao;
  var index = 0;
  // final List<MateriaModel> materiaList = MateriaDataSample.materiaList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.85,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (index < (questoes.length-1)) {
                                    index++;
                                  } else {
                                    index = 0;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 8,
                                  left: 8,
                                  right: 15,
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffBDBDBD),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: const Text(
                                    'Novo Tópico',
                                    style: TextStyle(
                                      color: Color(0xff616161),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  questoes[index].pergunta,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 2.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AnswerPage(
                                              materia: widget.materia,
                                              questao: questoes[index],
                                            )));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  color: Color(0xffBDBDBD),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'Clique aqui para ver a resposta  ',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff616161),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff616161),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Você acertou 10 de 60 tópicos.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey[200],
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.green),
                                minHeight: 40,
                                value: 0.16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Você está revisando 0 de 60 tópicos.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey[200],
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.green),
                                minHeight: 40,
                                value: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Você acertou 0 de 60 tópicos.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey[200],
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.green),
                                minHeight: 40,
                                value: 0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
