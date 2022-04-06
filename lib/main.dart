import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:burrdle/Components/header.dart';
import 'package:burrdle/Components/body.dart';
import 'package:burrdle/Components/footer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.length == 0) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app(); // if already initialized, use that one
  }
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burrdle",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Body(),
    );
  }
}

/*
Container(
        color: Colors.brown[200], //Sets background color of whole website
        child: Column(
          children: [Header(), Body(), FooterWidget()],
        ));
 */
