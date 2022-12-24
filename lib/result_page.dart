import "package:flutter/material.dart";

import './calculate_func.dart';
import "./user_data.dart";

class ResultPage extends StatelessWidget {
  final UserData user;
  const ResultPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sonuç Sayfası")),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 8,
          child: Center(
              child: Text(
            calculate(user).bringResult().round().toString(),
            style: const TextStyle(fontSize: 20),
          )),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black54)),
              child: const Text("GERİ DÖN")),
        ),
      ]),
    );
  }
}
