import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  int _currentIndex = 1;

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

      body:Column(
        children: [
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  SizedBox(height:100),
                  Text('Card',
                      style: TextStyle(
                        fontSize: 50,
                      )
                  ),
                  SizedBox(height:30),
                  Text('Title',
                      style: TextStyle(
                        fontSize: 100,
                      )
                  ),
                  SizedBox(height:100),
                ],
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  disabledForegroundColor: Colors.grey,
                ),
                onPressed: () {},
                child: const Text('Show Answer',
                    style: TextStyle(
                      fontSize: 35,
                    )),
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next),
                iconSize: 100,
                color: Colors.blue,
                onPressed: () {},
              ),
              ],
          )
        ],
      )
    );
  }
}
