import 'package:flutter/material.dart';



class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _currentIndex = 0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
            itemBuilder: (context,index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: Colors.cyan[300],
                  border:  Border.all(
                    width: 3,
                    color: Colors.blueAccent,
                  ),
                ),
                padding: const EdgeInsets.all(8),

                margin: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("Question",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,)),
                        SizedBox(height: 10),
                        Text("Answer",
                          style: TextStyle(
                            fontSize: 24,),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.delete,
                        size: 20),
                  ],
                ),
              );
            }),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flash Cards",
            style: TextStyle(
              fontSize: 35,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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

