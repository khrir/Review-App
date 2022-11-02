import "package:flutter/material.dart";
import 'package:review_app/pages/cards/card_form.dart';

FloatingActionButton getFloatingActionButton(context) {
  return FloatingActionButton(onPressed: () {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) {
          return const CardForm();
        }
      ),
    );
  });
}
