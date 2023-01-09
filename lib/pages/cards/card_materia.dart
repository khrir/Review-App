import 'package:flutter/material.dart';
import 'package:review_app/data/materia_dao.dart';
import 'package:review_app/models/materia_model.dart';
import 'package:review_app/pages/cards/card_form.dart';

class MateriaModalPage extends StatefulWidget {
  const MateriaModalPage({super.key});

  @override
  State<MateriaModalPage> createState() => _MateriaModalPageState();
}

class _MateriaModalPageState extends State<MateriaModalPage> {
  final _formKey = GlobalKey<FormState>();
  final _materiaNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Materia",
                          style: TextStyle(color: Colors.purple, fontSize: 24),
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
                          controller: _materiaNameController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusColor: Colors.white,
                            hintText: "Digite o nome da matéria",
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
          ],
        ),
      ],
    );
  }

  onPressed(context) async {
    if (_formKey.currentState!.validate()) {
      String materiaDigitadaName = _materiaNameController.text;

      MateriaModel materiaInserida = MateriaModel(name: materiaDigitadaName);
      await MateriaDao().salvarMateria(materia: materiaInserida);

      showSnackBar('A materia foi salva com sucesso!', context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const CardForm()));
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
