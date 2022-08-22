import 'package:flutter/material.dart';

import 'screens/home_page.dart';

/// Entry point of the app
void main() {
  runApp(const MyApp());
}

/// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
