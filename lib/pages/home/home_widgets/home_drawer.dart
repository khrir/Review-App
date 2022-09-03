import 'package:flutter/material.dart';
import 'package:review_app/pages/home/home.dart';
import 'package:review_app/pages/login/login_screen.dart';
import 'package:review_app/pages/sobrereview/sobrereview.dart';

Drawer getHomeDrawer(context) {
  return Drawer(
    child: Container(
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/review-logo.png',
              height: 20,
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              hoverColor: const Color.fromARGB(255, 27, 3, 63),
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Área de estudo",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              hoverColor: const Color.fromARGB(255, 27, 3, 63),
              enabled: true,
              leading: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LoginScreen()));
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              hoverColor: const Color.fromARGB(255, 27, 3, 63),
              leading: const Icon(
                Icons.support,
                color: Colors.white,
              ),
              title: const Text(
                "Sobre o Review",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Sobrereview()));
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              hoverColor: const Color.fromARGB(255, 27, 3, 63),
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "Configurações",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
