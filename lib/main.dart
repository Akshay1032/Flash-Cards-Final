import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/add_card.dart';
import 'pages/cards.dart';
import 'pages/practice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future deleteCard({required String question}) async {
  final docUser = FirebaseFirestore.instance.collection('cardQuestions').doc(question);
  docUser.delete();
}

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
