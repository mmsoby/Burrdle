import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[900], //Overrides background color of header
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(flex: 6),
          TextButton(
              onPressed: () {
                showAlertDialog(context);
              },
              child: Text(
                "HOW TO PLAY",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
          Spacer(flex: 1),
          IconButton(
            onPressed: () {
              showStatsDialog(context);
            },
            icon: Icon(
              Icons.bar_chart,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("HOW TO PLAY"),
      content: Container(
        height: 300.0,
        width: 300.0,
        child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('You must guess the player of the day!'),
            ),
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('You have 6 tries to determine who the player is'),
            ),
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('Ameen is king of the UFC'),
            ),
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('wooooooooooooooooooooooooooooooo'),
            ),
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('Ameen is king of the UFC'),
            ),
            ListTile(
              leading: Icon(Icons.stop_circle_sharp),
              title: Text('Ameen is king of the UFC'),
            ),
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showStatsDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        title: Text("Player Stats"), content: Text("Work in progress :)"));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
