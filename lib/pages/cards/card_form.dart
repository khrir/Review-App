import 'dart:async';

import 'package:flutter/material.dart';
import 'package:review_app/data/materia_dao.dart';
import 'package:review_app/data/questao_dao.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/models/question_model.dart';
import 'package:review_app/pages/cards/card_materia.dart';
import 'package:review_app/pages/home/home.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);
  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  final _perguntaController = TextEditingController();
  final _descricaoController = TextEditingController();

  List<MateriaModel> _materiaList = [];
  String selectedMateria = '';

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      backgroundColor: Colors.white70,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 0.6,
        minChildSize: 0.32,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const MateriaModalPage(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadMateriaCategories();
  }

  _loadMateriaCategories() async {
    _materiaList = await MateriaDao().listarMaterias();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(131, 90, 2, 131),
        onPressed: () => _showModalBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
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
              child: Padding(
                padding: EdgeInsets.zero,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 7, left: 10),
                              child: Text(
                                "Adicionar questão",
                                textScaleFactor: 2,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => {
                              Navigator.pop(context),
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Image.asset(
                              "assets/review-logo.png",
                              height: 125,
                            ),
                          )
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Pergunta",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 250,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Campo de pergunta obrigatório';
                                      }
                                      return null;
                                    },
                                    controller: _perguntaController,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Colors.white,
                                      hintText: "Digite a pergunta",
                                      hintStyle:
                                          TextStyle(color: Colors.black54),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 35, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Resposta",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 250,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Campo de resposta obrigatório';
                                      }
                                      return null;
                                    },
                                    controller: _descricaoController,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Digite a resposta",
                                      hintStyle:
                                          TextStyle(color: Colors.black54),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 35, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Matéria",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 250,
                                  child: DropdownButton<String>(
                                    hint: const Text('Nome da materia'),
                                    items: _materiaList
                                        .map<DropdownMenuItem<String>>((val) {
                                      return DropdownMenuItem(
                                        value: val.name,
                                        child: Text(val.name),
                                      );
                                    }).toList(),
                                    value: selectedMateria.isNotEmpty
                                        ? selectedMateria
                                        : null,
                                    onChanged: (newValue) async {
                                      setState(() {
                                        selectedMateria = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                    ),
                                    onPressed: () => onPressed(context),
                                    child: const Text(
                                      "Inserir",
                                      style: TextStyle(
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onPressed(context) async {
    if (_formKey.currentState!.validate()) {
      String perguntaDigitada = _perguntaController.text;
      String descricaoDigitada = _descricaoController.text;
      String materiaDigitadaName = selectedMateria;

      QuestionModel questaoInserida = QuestionModel(
          pergunta: perguntaDigitada,
          descricao: descricaoDigitada,
          materiaName: materiaDigitadaName);
      await QuestaoDao().salvarQuestao(questao: questaoInserida);

      showSnackBar('A questão foi salva com sucesso!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
    } else {
      showSnackBar("Erro na validação", context);
    }
  }

  showSnackBar(String msg, context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
