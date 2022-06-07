import 'package:flutter/material.dart';
import 'package:burrdle/Components/PlayersSelected.dart';
import 'package:burrdle/Components/Player.dart';

class DisplayTable extends StatefulWidget {
  const DisplayTable({Key? key}) : super(key: key);

  @override
  State<DisplayTable> createState() => _DisplayTableState();
}

class _DisplayTableState extends State<DisplayTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: PlayersSelected.players,
        builder: (context, subCount, child) {
          List<TableRow> rows = List.empty(growable: true);
          rows.add(buildRow(
              ["NAME", "TEAM", "CONF", "DIV", "POS", "HT", "AGE", "#"],
              isHeader: true));
          for (var i = 0; i < PlayersSelected.players.value.length; i++) {
            Player x = PlayersSelected.players.value.elementAt(i);
            rows.add(buildRow([
              x.name!,
              x.team!,
              x.conf!,
              x.div!,
              x.pos!,
              x.ht!,
              x.birthdate!,
              x.num!
            ]));
          }

          return Table(
            border: TableBorder.all(),
            children: rows,
          );
        },
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
        );
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(child: Text(cell, style: style)),
        );
      }).toList());
}
