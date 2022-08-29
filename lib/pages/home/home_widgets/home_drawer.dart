import 'package:flutter/material.dart';

Drawer getHomeDrawer() {
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
          const ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              "Área de estudo",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          
          const ListTile(
            leading: Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
            title: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.support,
              color: Colors.white,
            ),
            title: Text(
              "Sobre o Review",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Configurações",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  );
}
