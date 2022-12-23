import 'package:flutter/material.dart';
import 'package:flutter_apps/question_set.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Stream<List<QuestionSet>> readCards()  {
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = FirebaseFirestore.instance.collection('cardQuestions').snapshots();
  return snapshots.map((event) => event.docs.map((e) => QuestionSet.fromJson(e.data())).toList());
}

Future deleteCard({required String question}) async {
  final docUser = FirebaseFirestore.instance.collection('cardQuestions').doc(question);
  docUser.delete();
}

Widget buildUser(QuestionSet questionSet) =>
    const ListTile(
      // leading: CircleAvatar(child: Text('${user.birthday}')),
      //title: Text(questionSet.question),
      //subtitle: Text(questionSet.answer),
      title: Text("Akshay"),
    );