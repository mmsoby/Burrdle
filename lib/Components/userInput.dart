import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:burrdle/Components/PlayersSelected.dart';
import 'package:burrdle/Components/Player.dart';
import 'package:burrdle/Components/DBConnect.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final playersSelected = TextEditingController();
  String selectedPlayer = "";

  int turnCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
      child: DropDownField(
        controller: playersSelected,
        hintText: "Select Player",
        enabled: true,
        items: DBConnect.namesList,
        onValueChanged: (value) {
          //For some reason, needed to add the extra parentheses
          // and semicolon for this to work.
          setState(() {
            selectedPlayer = value;
            turnCount += 1;
            if (turnCount < 7) {
              //Grab data from database and add to table
              DBConnect.addPlayer(value);
            }
          });
        },
      ),
    );
  }
}
