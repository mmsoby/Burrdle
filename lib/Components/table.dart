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
          AddColoredEmojiCallCount = 0;
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
            if (PlayersSelected.players.value.length == 6) {}
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
            child: Center(
                child: Text(DetermineHtDirection(cells[5], isHeader),
                    style: style)),
          )),
      Container(
          color: DetermineStyle(cells[6], isHeader, 6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
                child: Text(DetermineAgeDirection(cells[6], isHeader),
                    style: style)),
          )),
      Container(
          color: DetermineStyle(cells[7], isHeader, 7),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
                child: Text(DetermineNumDirection(cells[7], isHeader),
                    style: style)),
          )),
    ]);
  }

  static String DetermineHtDirection(text, isHeader) {
    if (isHeader) {
      return text;
    }

    int potdFeet = int.parse(DBConnect.potd.ht!.substring(0, 1));
    int potdInches = int.parse(
        DBConnect.potd.ht!.substring(DBConnect.potd.ht!.indexOf("-") + 1));

    int guessFeet = int.parse(text.substring(0, 1));
    int guessInches = int.parse(text.substring(text.indexOf("-") + 1));

    if (text == DBConnect.potd.ht!) {
      return text;
    } else if (guessFeet > potdFeet) {
      return text + " ⬇️";
    } else if (guessFeet < potdFeet) {
      return text + " ⬆️";
    } else if (guessInches > potdInches) {
      return text + " ⬇️";
    } else if (guessInches < potdInches) {
      return text + " ⬆️";
    }

    return "";
  }

  static String DetermineNumDirection(text, isHeader) {
    if (isHeader) {
      return text;
    }
    if (int.parse(text) < DBConnect.potd.num!) {
      return text + " ⬆️";
    } else if (int.parse(text) > DBConnect.potd.num!) {
      return text + " ⬇️";
    } else {
      return text;
    }
  }

  static String DetermineAgeDirection(text, isHeader) {
    if (isHeader) {
      return text;
    }

    //POTD age variables
    int potdYear = int.parse(DBConnect.potd.birthdate!
        .substring(DBConnect.potd.birthdate!.length - 4));
    int potdMonth = int.parse(DBConnect.potd.birthdate!
        .substring(0, DBConnect.potd.birthdate!.indexOf("/")));
    int potdDay = int.parse(DBConnect.potd.birthdate!.substring(
        DBConnect.potd.birthdate!.indexOf("/") + 1,
        DBConnect.potd.birthdate!
            .indexOf("/", DBConnect.potd.birthdate!.indexOf("/") + 1)));

    int potdAge = (DateTime.now()
                .difference(DateTime(potdYear, potdMonth, potdDay))
                .inDays /
            365)
        .floor()
        .toInt();

    //Player's guess age variables
    int guessYear = int.parse(text.substring(text.length - 4));
    int guessMonth = int.parse(text.substring(0, text.indexOf("/")));
    int guessDay = int.parse(text.substring(
        text.indexOf("/") + 1, text.indexOf("/", text.indexOf("/") + 1)));

    int guessAge = (DateTime.now()
                .difference(DateTime(guessYear, guessMonth, guessDay))
                .inDays /
            365)
        .floor()
        .toInt();

    String guessAgeAsString = guessAge.toString();

    if (potdAge > guessAge) {
      return guessAgeAsString + " ⬆️";
    } else if (potdAge < guessAge) {
      return guessAgeAsString + " ⬇️";
    }
    return potdAge.toString();
  }

  static int AddColoredEmojiCallCount = 0;

  static void AddColoredEmoji(Color color) {
    int row = (AddColoredEmojiCallCount / 8).floor();
    int col = AddColoredEmojiCallCount % 8;
    print("row $row : col $col");

    String result;

    if (color == Colors.green) {
      result = "🟩";
    } else if (color == Colors.yellow) {
      result = "🟨";
    } else {
      result = "⬜";
    }

    DBConnect.resultList[row][col] = result;

    AddColoredEmojiCallCount++;
  }

  static Color DetermineStyle(text, isHeader, index) {
    var color = Colors.white;
    if (isHeader) {
      return color;
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
      } else {
        color = Colors.yellow;
      }
    } else if (index == 6) {
      //age
      if (text == DBConnect.potd.birthdate) {
        color = Colors.green;
      } else {
        color = Colors.yellow;
      }
    } else if (index == 7) {
      //number
      if (text == DBConnect.potd.num.toString()) {
        color = Colors.green;
      } else {
        color = Colors.yellow;
      }
    }
    AddColoredEmoji(color);
    return color;
  }
}
