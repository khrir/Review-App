import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF2C0469),
    leading: const Icon(Icons.menu),
    title: Image.asset(
      'assets/review-logo.png',
      fit: BoxFit.cover, height: 72,
    ),
    centerTitle: true,
  );
}
