import "package:flutter/material.dart";
import 'package:review_app/pages/cards/card_form.dart';

FloatingActionButton getFloatingActionButton(context) {
  return FloatingActionButton(
      backgroundColor: const Color.fromARGB(131, 90, 2, 131),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const CardForm();
          }),
        );
      },
      child: const Icon(Icons.add));
}
