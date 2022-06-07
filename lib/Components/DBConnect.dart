// This class tells us the player of the day.
// It also retrieves selected player data from firebase.
import 'package:flutter/material.dart';
import 'package:burrdle/Components/Player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:burrdle/Components/PlayersSelected.dart';

class DBConnect {
  static void addPlayer(String name) async {
    final ref = FirebaseFirestore.instance
        .collection("Players")
        .doc(name)
        .withConverter(
          fromFirestore: Player.fromFirestore,
          toFirestore: (Player player, _) => player.toFirestore(),
        );

    final docSnap = await ref.get();
    final player = docSnap.data(); // Convert to Player object

    if (player != null) {
      print(
          "Player is not null: ${player.name} ${player.team} ${player.pos} ${player.birthdate} ${player.ht} ${player.conf} ${player.num} ${player.div} ${player.team}");
    } else {
      print("No such document.");
    }

    PlayersSelected.addPlayer(player!);
    //return player!;
  }
}
