import 'package:flutter/cupertino.dart';

class GlobalProperties {
  //Theme
  builBackGround(Widget child) {
    return Container(
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
      child: child,
    );
  }
}
