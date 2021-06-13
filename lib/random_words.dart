//Import dart material design
import 'package:flutter/material.dart';
// import 'package:wordpair_generator/main_old.dart';
//Import added English word package
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
// import 'package:english_words/english_words.dart';s

//--------------------RandomWords extends StatefulWidget--------------------//
class RandomWords extends StatefulWidget {
  @override
  //Call
  RandomWordsState createState() => RandomWordsState();
}
//--------------------./RandomWords extends StatefulWidget--------------------//

//--------------------RandomWordsState extends State--------------------//
class RandomWordsState extends State<RandomWords> {
  //Variables
  final _randomWordPairs = <WordPair>[]; //Random words pairs list/array
  final _savedWordPairs =
      Set<WordPair>(); //A set is list items thaat can appear only once

//Declare Widgets
  Widget _buildList() {
    //List view
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        //Loop through list
        final index = item ~/ 2; //Get index without the dividers
        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        //Call custom row and push the word pairs
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  //Create build Row UI
  Widget _buildRow(WordPair pair) {
    //Variables
    final alreadySaved = _savedWordPairs
        .contains(pair); //Check it contains saved word pairs defined above
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), //Add icon and customize depending on what the lists contains
      onTap: () {
        //Save/remove pair on state onTap
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    ); //Just a row
  }

//--------------------_pushSaved--------------------//
  void _pushSaved() {
    //Add navigator
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 16.0),
          ),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          //Create view of the new Row
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }
  //--------------------./_pushSaved--------------------//

  //Create build UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WordPair Generator"), //title
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ], //Button
      ),
      body: _buildList(), //Call
    );
  }
}
//--------------------./RandomWordsState extends State--------------------//
