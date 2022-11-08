import 'package:flutter/material.dart';
import 'package:review_app/data/db_helper.dart';
import 'package:review_app/data/questao_dao.dart';
import 'package:review_app/models/question_model.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);
  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  final _perguntaController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idMateriaController = TextEditingController();
  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              padding: EdgeInsets.only(top: 7),
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
                              size: 25,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 10),
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
                            width: 300,
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
                                hintStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, bottom: 10),
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
                            width: 300,
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
                                hintStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, bottom: 10),
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
                            width: 300,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo id obrigatório';
                                }
                                return null;
                              },
                              controller: _idMateriaController,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Digite o id da matéria",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                              ),
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
      int idMateriaDigitada = int.parse(_idMateriaController.text);

      QuestionModel questaoInserida = QuestionModel(
          pergunta: perguntaDigitada,
          descricao: descricaoDigitada,
          idMateria: idMateriaDigitada);
      await QuestaoDao().salvarQuestao(questao: questaoInserida);

      showSnackBar('A questão foi salva com sucesso!', context);
      Navigator.pop(context);
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
