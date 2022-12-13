import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_apps/my_globals.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  int _currentIndex = 1;
  String _answerToThisCard=" ";
  var randomNumber= Random();
  int i=0;

  @override
  Widget build(BuildContext context) {
    _currentIndex = 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flash Cards",
            style: TextStyle(
              fontSize: 35,
            )),
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
          if (index == 0){
            Navigator.popUntil(context, ModalRoute.withName('/card'));
          }
        },
        selectedItemColor: Colors.amber[800],
      ),

      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height:150),
            Text(questionBank[i].question,
                style: const TextStyle(
                  fontSize: 50,
                )),
            const SizedBox(height:20),
            Text(_answerToThisCard,
                style: const TextStyle(
                  fontSize: 50,
                )),
            const SizedBox(height:100),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 10, 20),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.yellow[900],
                      disabledForegroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _answerToThisCard = questionBank[i].answer;
                      });
                    },
                    child: const Text('Show Answer',
                        style: TextStyle(
                          fontSize: 35,
                        )),
                  ),
                  const SizedBox(width:15),
                  IconButton(
                    icon: const Icon(Icons.navigate_next),
                    iconSize: 100,
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        _answerToThisCard = " ";
                        i = randomNumber.nextInt(questionBank.length);
                      });
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
