import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:review_app/data/user_dao.dart';
import 'package:review_app/global_properties.dart';
import 'package:review_app/pages/cadastro/cadastrar.dart';
import 'package:review_app/pages/home/home.dart';
import 'package:review_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userDao = UserDao();

  Future<bool> signIn() async {
    if (_emailController.text != '' && _passwordController.text != '') {
      await userDao.login(_emailController.text, _passwordController.text).then(
            (value) => {
              if (value.id != null)
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                  ),
                },
            },
          );
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GlobalProperties().builBackGround(
        ListView(
          children: [
            Stack(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 09),
                    child: Text(
                      "Login",
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
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: Image.asset(
                    "assets/review-logo.png",
                    height: height * 0.17,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                bottom: height * 0.01,
              ),
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
              children: [
                SizedBox(
                  width: width * 0.75,
                  child: customTextField(
                    "Digite seu email",
                    _emailController,
                    false,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.05,
                bottom: height * 0.01,
              ),
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
              children: [
                SizedBox(
                  width: width * 0.75,
                  child: customTextField(
                    "Digite sua senha",
                    _passwordController,
                    true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.15,
                      ),
                    ),
                    onPressed: () => {
                      signIn(),
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
                  padding: EdgeInsets.only(top: height * 0.06),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    TextSpan(
                      text: "Ainda não possui cadastro? ",
                      children: [
                        TextSpan(
                          text: "cadastre-se",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Cadastrar(),
                                  ));
                            },
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
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
