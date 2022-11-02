import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);
  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
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
                                "Cadastrar",
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
                        children: const [
                          SizedBox(
                            height: 35,
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
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
                        children: const [
                          SizedBox(
                            height: 35,
                            width: 300,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
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
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomePage()))
                              },
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
}
