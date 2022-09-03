import 'package:flutter/material.dart';

class Sobrereview extends StatefulWidget {
  const Sobrereview({Key? key}) : super(key: key);

  @override
  State<Sobrereview> createState() => _SobrereviewState();
}

class _SobrereviewState extends State<Sobrereview> {
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
        child: Column(children: [
          Stack(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    "Sobre o Review",
                    textScaleFactor: 2.5,
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
                  size: 35,
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
          Card(
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              clipBehavior: Clip.antiAlias,
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 5.0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            textAlign: TextAlign.justify,
                            "O Review é um aplicativo de flashcard que tem por objetivo ajudar os estudantes a aprender de forma dinâmica e prática. Ele conta com vários tópicos de diversas matérias e foi criado por alunos do quarto ano do IFAL.",
                            style: TextStyle(
                                color: Color.fromARGB(255, 146, 81, 221),
                                fontSize: 25.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
