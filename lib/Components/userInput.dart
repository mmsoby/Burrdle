import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search Players',
          ),
        ),
      ),
    );
  }
}
