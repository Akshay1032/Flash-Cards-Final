import 'package:flutter/material.dart';
import 'pages/cards.dart';
import 'pages/practice.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/card',
    routes: {
      '/card': (context) => const FlashCard(),
      '/practice': (context) => const Practice(),
    },
  ));
}
