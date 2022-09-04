import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home_widgets/app_bar/app_bar.dart';
import 'package:review_app/pages/login/login_screen.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);
  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar(),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Image.asset(
                  "assets/review-logo.png",
                  height: 125,
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: Text(
                        "E-mail",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Insira seu e-mail",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Senha",
                        // textAlign: TextAlign.right,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Insira sua senha",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                    onPrimary: const Color(0xFF2C0469),
                    primary: Colors.white,
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Ao criar uma conta você concorda com os ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "termos e condições",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Já possui cadastro? ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Login!",
                        recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (BuildContext  context) => const LoginScreen(),
                                  )
                                );
                            },
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      onPrimary: const Color(0xFFFFFFFF),
                      primary: const Color(0xFF1877F2),
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Continuar pelo Facebook",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: const Color(0xFFFFFFFF),
                    primary: const Color(0xFF000000),
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Continuar pelo Google",
                    style: TextStyle(
                      fontSize: 17,
                    ),
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
