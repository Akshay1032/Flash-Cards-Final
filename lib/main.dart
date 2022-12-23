import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/add_card.dart';
import 'pages/cards.dart';
import 'pages/practice.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/card',
    routes: {
      '/card': (context) => const FlashCard(),
      '/practice': (context) => const Practice(),
      '/addCard': (context) => const AddCard(),
    },
  ));
}
