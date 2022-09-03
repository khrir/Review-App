import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Stack(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      "Login",
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
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Email",
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
                      hintText: "Digite seu email",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
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
                    "Senha",
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
                      hintText: "Digite sua senha",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
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
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage())
                                      )
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(top: 30),
                  child: const Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    TextSpan(
                      text: "Ainda não possui cadastro? ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "cadastre-se",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
