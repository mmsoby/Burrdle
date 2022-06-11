import 'package:flutter/material.dart';
import 'package:burrdle/Components/PlayersSelected.dart';
import 'package:burrdle/Components/Player.dart';
import 'package:burrdle/Components/DBConnect.dart';

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
              x.num!.toString()
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

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    final style = TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 18);

    return TableRow(children: [
      Container(
          color: DetermineStyle(cells[0], isHeader, 0),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[0], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[1], isHeader, 1),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[1], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[2], isHeader, 2),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[2], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[3], isHeader, 3),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[3], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[4], isHeader, 4),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[4], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[5], isHeader, 5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[5], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[6], isHeader, 6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[6], style: style)),
          )),
      Container(
          color: DetermineStyle(cells[7], isHeader, 7),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cells[7], style: style)),
          )),
    ]);
  }

  static Color DetermineStyle(text, isHeader, index) {
    var color = Colors.white;
    if (isHeader) {
    } else if (index == 0) {
      //name
      if (text == DBConnect.potd.name) {
        color = Colors.green;
      }
    } else if (index == 1) {
      //team
      if (text == DBConnect.potd.team) {
        color = Colors.green;
      }
    } else if (index == 2) {
      //conf
      if (text == DBConnect.potd.conf) {
        color = Colors.green;
      }
    } else if (index == 3) {
      //div
      if (text == DBConnect.potd.div) {
        color = Colors.green;
      }
    } else if (index == 4) {
      //pos
      if (text == DBConnect.potd.pos) {
        color = Colors.green;
      }
    } else if (index == 5) {
      //ht
      if (text == DBConnect.potd.ht) {
        color = Colors.green;
      }
    } else if (index == 6) {
      //age
      if (text == DBConnect.potd.birthdate) {
        color = Colors.green;
      }
    } else if (index == 7) {
      //number
      if (text == DBConnect.potd.num.toString()) {
        color = Colors.green;
      }
    } else {}
    return color;
  }
}
