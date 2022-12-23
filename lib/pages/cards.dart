import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/add_card.dart';
import 'package:flutter_apps/question_set.dart';
import 'package:flutter_apps/support_func.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int _currentIndex = 0;
  Widget cardTemplate(questionHere) {
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
              Text(
                questionHere.question,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                questionHere.answer,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 120),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        //questionBank.remove(questionHere);
                        deleteCard(question: questionHere.question);
                      });
                    },
                    icon: const Icon(Icons.delete, size: 30),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = 0;
    return InternetWidget(
        offline: EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_4,
          title: 'No Internet Connection',
          subTitle: 'Connect to the internet to continue',
          titleTextStyle: const TextStyle(
            fontSize: 22,
            color: Color(0xff9da9c7),
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xffabb8d6),
          ),
        ),
        online: Scaffold(
          body: StreamBuilder<List<QuestionSet>>(
              stream: readCards(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final cards = snapshot.data!;
                  if (cards.length < 1) {
                    return EmptyWidget(
                      image: null,
                      packageImage: PackageImage.Image_3,
                      title: 'No Cards',
                      subTitle: 'No questions have been added',
                      titleTextStyle: const TextStyle(
                        fontSize: 22,
                        color: Color(0xff9da9c7),
                        fontWeight: FontWeight.w500,
                      ),
                      subtitleTextStyle: const TextStyle(
                        fontSize: 14,
                        color: Color(0xffabb8d6),
                      ),
                    );
                  } else {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: cards
                          .map((questionHere) => cardTemplate(questionHere))
                          .toList(),
                    );
                  }
                } else {
                  //return const Center(child: CircularProgressIndicator());
                  return EmptyWidget(
                    image: null,
                    packageImage: PackageImage.Image_3,
                    title: 'No Cards',
                    subTitle: 'No questions have been added',
                    titleTextStyle: const TextStyle(
                      fontSize: 22,
                      color: Color(0xff9da9c7),
                      fontWeight: FontWeight.w500,
                    ),
                    subtitleTextStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffabb8d6),
                    ),
                  );
                }
              }),
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Flash Cards",
                style: TextStyle(
                  fontSize: 35,
                )),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCard()),
              ).then((value) => setState(() {}));
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
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 1) {
                Navigator.pushNamed(context, '/practice');
              }
            },
            selectedItemColor: Colors.amber[800],
          ),
        ));
  }
}
