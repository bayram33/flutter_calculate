import 'package:flutter/material.dart';

import "./input_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
        ),
      ),
      home: const InputPage(),
    );
  }
}
