import 'package:flutter/material.dart';

appBar(context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      backgroundColor: const Color(0xFF2C0469),
      elevation: 10,
      leading: IconButton(
        enableFeedback: true,
        iconSize: 50,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            width: 150,
            child: Center(
              child: Image.asset("assets/img/review-logo.png"),
            ),
          )
        ],
      ),
    ),
  );
}
