import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Text('A random key idea:'), 
           //Text(pair.current.asLowerCase),
          BigCard(pair: pair),
          ElevatedButton(
            onPressed: () {
              //print('button pressed!');
               appState.getNext();  
            },           
            child: Text('Next', textDirection: TextDirection.ltr, style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
          ),
          const Center(),
          Padding(padding: EdgeInsets.fromLTRB(1, 20, 1, 10), child: Text("With padding yow")),

          SizedBox(
            height: 210,
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      '1625 Main Street',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('My City, CA 99984'),
                    leading: Icon(Icons.restaurant_menu, color: Colors.blue[500]),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    visualDensity: VisualDensity(horizontal: 4, vertical: -4),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      '(408) 555-1212',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
                  ),
                  ListTile(
                    title: const Text('costa@example.com'),
                    leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),        
    );
  }
}


class MyAppState extends ChangeNotifier {
   var current = WordPair.random();
   void getNext() {
       current = WordPair.random();
       notifyListeners();
     }
}



class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {

    //return Text(pair.asLowerCase)

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}