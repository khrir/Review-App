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
                    "Sobre o review",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 320,
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: const Text(
                        "O Review é um aplicativo de flashcard que tem por objetivo ajudar os estudantes a aprender de forma dinâmica e prática. Ele conta com vários tópicos de diversas matérias. ",
                  ),
                ),
            ],
          )
        ]),
      ),
    );
  }
}
