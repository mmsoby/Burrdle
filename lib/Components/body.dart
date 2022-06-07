import 'package:flutter/material.dart';
import 'package:burrdle/Components/userInput.dart';
import 'package:burrdle/Components/table.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 50),
          DefaultTextStyle(
            // Title
            child: Text("BURRDLE"),
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          SizedBox(height: 30),
          DefaultTextStyle(
            // Subheading
            child: Text("FOOTBALL PLAYER GUESSING GAME"),
            style: TextStyle(fontSize: 30.0, color: Colors.blue[900]),
          ),
          SizedBox(height: 30),
          UserInput(),
          SizedBox(height: 30),
          DisplayTable(),
        ]);
  }
}
