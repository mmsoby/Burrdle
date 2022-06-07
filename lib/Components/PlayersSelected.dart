import 'package:flutter/material.dart';
import 'package:burrdle/Components/Player.dart';

class PlayersSelected {
  static ValueNotifier<List<Player>> players =
      ValueNotifier(List.empty(growable: true));

  static void addPlayer(Player player) {
    players.value.add(player);
    players.notifyListeners();
  }
}
