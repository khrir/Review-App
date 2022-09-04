import "package:flutter/material.dart";

BottomNavigationBar getHomeBottomNavigation(PageController pageViewController) {
  return BottomNavigationBar(
    backgroundColor: Colors.purple,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.description),
        label: 'About',
      ),
    ],
    onTap: (pagina) {
      pageViewController.animateToPage(
        pagina,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    },
  );
}
