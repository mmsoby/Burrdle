import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Player {
  Player({
    required this.name,
    required this.team,
    required this.conf,
    required this.div,
    required this.pos,
    required this.ht,
    required this.birthdate,
    required this.num,
    required this.famous,
  });

  final String? name;
  final String? team;
  final String? conf;
  final String? div;
  final String? pos;
  final String? ht;
  final String? birthdate;
  final String? num;
  final String? famous;

  factory Player.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Player(
        name: data?['name'],
        team: data?['team'],
        conf: data?['conf'],
        div: data?['div'],
        pos: data?['position'],
        ht: data?['height'],
        birthdate: data?['birthdate'],
        famous: data?['famous'],
        num: data?['number']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (team != null) "team": team,
      if (conf != null) "conf": conf,
      if (div != null) "div": div,
      if (pos != null) "position": pos,
      if (ht != null) "height": ht,
      if (birthdate != null) "birthdate": birthdate,
      if (num != null) "number": num,
      if (famous != null) "famous": famous,
    };
  }
}
