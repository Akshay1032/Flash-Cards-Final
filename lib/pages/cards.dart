import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/add_card.dart';
import 'package:flutter_apps/my_globals.dart';
import 'package:flutter_apps/question_set.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<QuestionSet>> readCards()  {
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = FirebaseFirestore.instance.collection('cardQuestions').snapshots();
  return snapshots.map((event) => event.docs.map((e) => QuestionSet.fromJson(e.data())).toList());
}

Widget buildUser(QuestionSet questionSet) =>
    const ListTile(
      // leading: CircleAvatar(child: Text('${user.birthday}')),
      //title: Text(questionSet.question),
      //subtitle: Text(questionSet.answer),
      title: Text("Akshay"),
    );

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int _currentIndex = 0;
  Widget cardTemplate (questionHere) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        color: Colors.orange[400],
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Text(questionHere.question,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              const SizedBox(height:20),
              Text(questionHere.answer,
                style: const TextStyle(
                  fontSize: 25,
                  color:Colors.white,
                ),),
              const SizedBox(height:10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width:120),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        questionBank.remove(questionHere);
                      });
                    },
                    icon: const Icon(Icons.delete, size:30),
                  ),
                ],
              )
            ],
          ),
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = 0;

    return Scaffold(
      body:StreamBuilder<List<QuestionSet>>(
          stream: readCards(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),
      /*GridView.count(
        crossAxisCount: 2,
        children:
        questionBank.map((questionHere) => cardTemplate(questionHere)).toList(),
      ),*/
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flash Cards",
            style: TextStyle(
              fontSize: 35,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push( context, MaterialPageRoute( builder: (context) => const AddCard()), ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Practice',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          if (index == 1){
            Navigator.pushNamed(context,'/practice');
          }
        },
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

