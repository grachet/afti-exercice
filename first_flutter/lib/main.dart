import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morpion',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Morpion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String player = "X";
  String won = "";

  List<List<String>> board = [
    // ["1", "2", "3"],
    // ["4", "5", "6"],
    // ["7", "8", "9"],
    ["-", "-", "-"],
    ["-", "-", "-"],
    ["-", "-", "-"],
  ];

  void test(List<String> line) {
    if (line[0] != "-" && line[0] == line[1] && line[2] == line[1]) {
      setState(() {
        won = line[0];
      });
    }
  }

  void _play(int index, int subIndex) {
    if (board[index][subIndex] == "-" && won == "") {
      setState(() {
        board[index][subIndex] = player;
        player = player == "X" ? "O" : "X";
      });
      test([
        board[0][0],
        board[1][0],
        board[2][0],
      ]);
      test([
        board[0][1],
        board[1][1],
        board[2][1],
      ]);
      test([
        board[0][2],
        board[1][2],
        board[2][2],
      ]);
      test([
        board[0][2],
        board[1][1],
        board[2][0],
      ]);
      test([
        board[0][0],
        board[1][1],
        board[2][2],
      ]);
      for (var row in board) {
        test(row);
      }
    }
  }

  var textStyle = TextStyle(
      fontSize: 24.0, color: Colors.blue, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              won == "" ? 'Player : ' + player : "Player " + won + " won",
              style: textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[0][0]),
                        onPressed: () => _play(0, 0),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[0][1]),
                        onPressed: () => _play(0, 1),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[0][2]),
                        onPressed: () => _play(0, 2),
                      ),
                    )
                  ],
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[1][0]),
                        onPressed: () => _play(1, 0),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[1][1]),
                        onPressed: () => _play(1, 1),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[1][2]),
                        onPressed: () => _play(1, 2),
                      ),
                    )
                  ],
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[2][0]),
                        onPressed: () => _play(2, 0),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[2][1]),
                        onPressed: () => _play(2, 1),
                      ),
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: TextButton(
                        child: Text(board[2][2]),
                        onPressed: () => _play(2, 2),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
