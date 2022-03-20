import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:burrdle/Components/header.dart';
import 'package:burrdle/Components/body.dart';
import 'package:burrdle/Components/footer.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown[200], //Sets background color of whole website
        child: Column(
          children: [Header(), Body(), FooterWidget()],
        ));
  }
}
