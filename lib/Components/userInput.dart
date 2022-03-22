import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final playersSelected = TextEditingController();
  String selectedPlayer = "awlad soby";

  List<String> players = [
    "Josh Allen",
    "Eli Apple",
    "Joe Burrow",
    "Jamar Chase"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
      child: DropDownField(
        controller: playersSelected,
        hintText: "Select Player",
        enabled: true,
        items: players,
        onValueChanged: (value) {
          //For some reason, needed to add the extra parentheses
          // and semicolon for this to work.
          setState(() {
            selectedPlayer = value;
          });
        },
      ),
    );
  }
}
