import 'package:flutter/material.dart';
import 'package:flutter_apps/my_globals.dart';
import 'package:flutter_apps/question_set.dart';

class AddCard extends StatefulWidget {

  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _textQuestionController = TextEditingController();
  final _textAnswerController = TextEditingController();
  String userQuestion = ' ';
  String userAnswer = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /*Expanded(
                    child: Container(
                        color: Colors.teal,
                        child: Center(
                            child: Text('$userQuestion, $userAnswer')))
                ),*/
                TextField(controller:  _textQuestionController,
                  decoration:  InputDecoration(
                    border:  const OutlineInputBorder(),
                    hintText: 'Question',
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textQuestionController.clear();
                        },
                        icon: const Icon(Icons.clear)),
                  ),
                ),
                const SizedBox(height:10),
                TextField(controller:  _textAnswerController,
                  decoration:  InputDecoration(
                    border:  const OutlineInputBorder(),
                    hintText: 'Answer',
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textAnswerController.clear();
                        },
                        icon: const Icon(Icons.clear)),
                  ),
                ),
                const SizedBox(height:10),
                MaterialButton(onPressed: (){
                    setState(() {
                      if ((_textQuestionController.text.isNotEmpty) && (_textAnswerController.text.isNotEmpty)){
                        userQuestion = _textQuestionController.text;
                        userAnswer = _textAnswerController.text;
                        questionBank.add(QuestionSet(question: userQuestion, answer: userAnswer));
                        Navigator.pop(context,);
                      }
                    });
                  },
                color: Colors.blue,
                child: const Text("Add Card",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )
                )
                ),
              ],
            ),
          ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add A New Card",
            style: TextStyle(
              fontSize: 35,
            )),
      ),
    );
  }
}
