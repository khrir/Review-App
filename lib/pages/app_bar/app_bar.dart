import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF2C0469),
    title: Image.asset(
      'assets/img/review-logo.png',
      fit: BoxFit.cover, height: 72,
    ),
    centerTitle: true,
  );
}