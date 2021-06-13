//Import dart material design
import 'package:flutter/material.dart';
//Import file
import './random_words.dart';

//Call main method
void main() => runApp(MyApp());

//--------------------MyApp extends StatelessWidget--------------------//
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Declare variables
    // final wordPair = WordPair.random(); //Class comes with our package

    return MaterialApp(
        //Configure home UI using
        // home: Text("Hello world", style: TextStyle(fontSize: 30.5, color: Colors.green[400])),
        theme: ThemeData(primaryColor: Colors.purple[900]),
        // home: Scaffold(
        //   appBar: AppBar(title: Text("WordPair Generator")), //AppBar
        //   body: Center(
        //       child: Text("Hello world, our random word today is " +
        //           wordPair.asLowerCase)),
        // ));
        //Call method
        home: RandomWords());
  }
}
//--------------------./MyApp extends StatelessWidget--------------------//
