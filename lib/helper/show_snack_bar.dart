import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massage),
      backgroundColor: Color.fromARGB(255, 56, 56, 56),
      margin: const EdgeInsets.all(15),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
